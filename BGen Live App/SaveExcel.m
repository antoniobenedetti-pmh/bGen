function app=SaveExcel(app)
app.any_new_bd = 1; 

M = zeros(app.R*app.T, app.n_var+1);

            x = 1:app.R;
            x = repmat(x, app.T, 1);
            x = -x(:);
            if(strcmp(app.InsilicoIDformatSwitch.Value, 'Numerical'))
                MM = x;
            else
                if(strcmp(app.InsilicoIDformatSwitch.Value, 'Textual'))
                    MM = num2str(x);
                end
            end
            
            x = app.t0 + (app.k/2:app.k:app.k/2+(app.T-1)*app.k);
            M(:, 1) = repmat(x', app.R, 1);

            M(:, 2:end) = vwu(app, app.INSILICO);

            M = splitvars(table(M));

            M = addvars(M, MM, 'Before', M.Properties.VariableNames{1});

            tab_names = cell(app.n_var+2, 1);
            tab_names{1} = char(app.Batch_ID_name);
            tab_names{2} = char(app.Time_name);
            for r = 3:app.n_var+2
                tab_names{r} = app.variables_names{r-2};
            end
            M.Properties.VariableNames = tab_names;

            NEW_TAB = table();
            sorted_names = app.tab_real_data.Properties.VariableNames;

            for i = 1:length(sorted_names)
                for w = 1:length(tab_names)
                    if(strcmp(tab_names(w), sorted_names(i)))
                        NEW_TAB = addvars(NEW_TAB,...
                            M(:, cell_to_str(app,tab_names(w))).Variables);
                        NEW_TAB.Properties.VariableNames{i} =...
                            cell_to_str(app,sorted_names(i));
                    end
                end
            end



            NEW_PAR = cell(0);
            
            NEW_PAR{size(NEW_PAR, 1) + 1, 1} = 'Date and time';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.date_time;

            NEW_PAR{size(NEW_PAR, 1) + 1, 1} = 'Real batches ID';
            for n = 1:app.N_real
                    w = app.real_batches_ID{n};
                    if(isa(w, 'cell'))
                        w = w{1};
                    end
                    NEW_PAR{size(NEW_PAR, 1), n+1} = w;
            end

            NEW_PAR{size(NEW_PAR, 1) + 1, 1} = 'Resampling interval';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.k;

            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'Number of resampled trajectories (J)';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.J;

            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'p_J';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.p_J;

            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'max_J';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.max_J_per_batch;
            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'delta_L';
            for n = 1:app.n_var
                NEW_PAR{size(NEW_PAR, 1), n+1} = app.delta_L(n);
            end

            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'std_th';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.std_th;

            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'choice_stopping';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.choice_stopping;
            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'R';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.R;
            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'R_last';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.R-app.R_old;

            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'Generation LB_set';
            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'Generation LB_value';
            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'Generation UB_set';
            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'Generation UB_value';
            for n = 1:app.n_var

                NEW_PAR{size(NEW_PAR, 1)-3, n+1} = app.old_bd.LB_set(n);
                if(app.old_bd.LB_set(n))
                    NEW_PAR{size(NEW_PAR, 1)-2, n+1} =...
                        app.old_bd.LB_value(n);
                else
                    NEW_PAR{size(NEW_PAR, 1)-2, n+1} = NaN;
                end


                NEW_PAR{size(NEW_PAR, 1)-1, n+1} = app.old_bd.UB_set(n);
                if(app.old_bd.UB_set(n))
                    NEW_PAR{size(NEW_PAR, 1), n+1} =...
                        app.old_bd.UB_value(n);
                else
                    NEW_PAR{size(NEW_PAR, 1), n+1} = NaN;
                end
            end
            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'any_new_bd';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.any_new_bd;
            app.any_new_bd = 0;

            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'forced_generation_stop';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.forced_stop &&...
                ~app.stop;

            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'R_per_iter';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.R_per_iter;
            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'num_z';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.num_z;
            NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'num_rect_max';            
            NEW_PAR{size(NEW_PAR, 1), 2} = app.num_rect_max;
            if(strcmp(app.choice_stopping, 'A'))
                NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'delta_F_th';
                NEW_PAR{size(NEW_PAR, 1), 2} = app.delta_F_th;
                NEW_PAR{size(NEW_PAR, 1)+1, 1} = 'delta_chi2_th';
                NEW_PAR{size(NEW_PAR, 1), 2} = app.delta_chi2_th;
            end

            NEW_PAR{size(NEW_PAR, 1) +1, 1} = 'exp_var_th';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.exp_var_th;
            NEW_PAR{size(NEW_PAR, 1) +1, 1} = 'conf_nipals';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.conf_nipals;
            NEW_PAR{size(NEW_PAR, 1) +1, 1} = 'iter_nipals';
            NEW_PAR{size(NEW_PAR, 1), 2} = app.iter_nipals;



                [name, path] = uiputfile('*.xlsx', 'Save in-silico batches table');                     
                full_path = [path name];
    
                if(name ~= 0)
                    writetable(NEW_TAB, full_path, 'Sheet', 'In-silico batches',...
                        'WriteMode', 'overwritesheet');
        
                    writecell(NEW_PAR, full_path, 'Sheet', 'Parameters',...
                        'WriteMode', 'overwritesheet');

                    MATLAB_DATA.full_path = full_path;
                end

            
            app.rng_states.resampling = rng;

            MATLAB_DATA.in_silico_batches = NEW_TAB;
            MATLAB_DATA.tab_parameters = NEW_PAR;
            MATLAB_DATA.rng_states.generation =...
                app.rng_states.generation;
            if(app.R_old == 0)
                MATLAB_DATA.rng_states.resampling = ...
                    app.rng_states.resampling;
                app.OLD_MATLAB_DATA = MATLAB_DATA;
            else
                MATLAB_DATA.old = app.OLD_MATLAB_DATA;
            end
            app.TEMP_MATLAB_DATA = MATLAB_DATA;

end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0        