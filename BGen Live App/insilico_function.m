  function [INSILICO_temp, R_temp, res_F, res_chi2, X_cal_temp,app] =...
                insilico_function(app)
  
            % This function performs the in-silico generation
                
            INSILICO_temp =...
                cat(1, app.INSILICO, zeros(0, app.n_var, app.T));
        
            app.stop = 0;
            app.forced_stop = 0;
        
            R_temp = 0;

            X_cal_temp = app.X_cal;

%             pause(0.01);

%             app.gen_status_1.Visible = 1;
%             app.gen_status_2.Visible = 1;
        
            while ~(app.stop || app.forced_stop)

                app.gen_status_1.Value = 'Generation';
                app.gen_status_2.Visible = 1;
                app.gen_status_2.Value = app.gen_status_1.Value;
                pause(1e-9);
        
                [new_trajs,app] = generate_many_insilico_trajectories(app);
                new_trajs = bound(app, new_trajs);
        
                INSILICO_temp = cat(1, INSILICO_temp, new_trajs);
                X_cal_temp = cat(1, X_cal_temp, bwu(app, new_trajs));

                app.NumberofinsilicobatchesEditField_2.Value = ...
                    app.NumberofinsilicobatchesEditField_2.Value +...
                    app.R_per_iter;

                R_temp = R_temp + app.R_per_iter;

        
                if(strcmp(app.choice_stopping, 'M'))
        
                    app.stop = (R_temp >= app.R_fixed);
        
                else

                    app.gen_status_1.Value = 'Fitting';
                    app.gen_status_2.Value = app.gen_status_1.Value;
        
                    [T2_temp, Q_temp, nPC_est, app] = do_PCA(app, X_cal_temp);
        
                    app.curr_pdf = 'F';
                    [v_approx_F_temp, num_rect_F_temp, delta_F_temp,...
                        v_true_F_temp, z_interv_F_temp, app] =...
                        approx_F(app, T2_temp, nPC_est);
        
                    app.curr_pdf = 'chi2';
                    [v_approx_chi2_temp, num_rect_chi2_temp, delta_chi2_temp,...
                        v_true_chi2_temp, z_interv_chi2_temp, app] =...
                        approx_chi2(app, Q_temp);

                    stop_F = delta_F_temp <= app.delta_F_th;


                    stop_chi2 = delta_chi2_temp <= app.delta_chi2_th;

                    app.stop = stop_F && stop_chi2;

                    app.ErrrorinthefittingofFEditField.Value = delta_F_temp;
                    app.Errorinthefittingofchi2EditField.Value = delta_chi2_temp;


                    
                end
            
            end

            app.StopgenerationButton.Text = 'Stop generation';



            if(strcmp(app.choice_stopping, 'M'))

                    
                X_cal_temp =...
                    bwu(app, cat(1, app.real_batches...
                    (:,:,app.k/app.m/2:app.k/app.m:...
                    (app.T-1)*app.k/app.m+...
                    app.k/app.m/2),...
                    INSILICO_temp));
    
                [T2_temp, Q_temp, nPC_est, app] = do_PCA(app, X_cal_temp);
    
                app.curr_pdf = 'F';
                [v_approx_F_temp, num_rect_F_temp, delta_F_temp,...
                    v_true_F_temp, z_interv_F_temp, app] =...
                    approx_F(app, T2_temp, nPC_est);
    
                app.curr_pdf = 'chi2';
                [v_approx_chi2_temp, num_rect_chi2_temp, delta_chi2_temp,...
                    v_true_chi2_temp, z_interv_chi2_temp, app] =...
                    approx_chi2(app, Q_temp);
            end

                    
            res_F = {z_interv_F_temp %%adding app.
                    v_true_F_temp
                    v_approx_F_temp
                    delta_F_temp
                    T2_temp
                    num_rect_F_temp};

            res_chi2 = {z_interv_chi2_temp %%adding app.
                        v_true_chi2_temp
                        v_approx_chi2_temp
                        delta_chi2_temp
                        Q_temp
                        num_rect_chi2_temp};
app.res_F=res_F;
app.res_chi2=res_chi2;
  end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0