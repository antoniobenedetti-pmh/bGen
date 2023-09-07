function plot_obj = plot_func2(app)

            % This function allows to plot the trajectories of the real
            % batches, of the in-silico ones and of the coverage indicator
            FigureBatch=uiaxes;
            legend(FigureBatch, 'off')
            FigureBatch.YLimMode = 'auto';
        
            if(strcmp(app.type_to_plot, 'R'))
                plot_obj = plot(FigureBatch,...
                    app.t0 + (0:app.T_bar-1)*app.m,...
                    squeeze(app.real_batches(:,app.var_to_plot,:))','k-',...
                    'LineWidth',1.5);

                legend(FigureBatch, plot_obj, 'Real');

                FigureBatch.XLim = app.t0 + [0 app.T_bar-1]*app.m;

            end

            if(strcmp(app.type_to_plot, 'RI'))

               

                plot_obj = plot(FigureBatch,...
                    app.t0 + (0.5 : 1 : app.T-.5)*app.k,...
                    squeeze(app.INSILICO(1, app.var_to_plot,:))',...
                    'r:', 'LineWidth', 1.5);

                if(app.R > 1)
                    plot(FigureBatch,...
                        app.t0 + (0.5 : 1 : app.T-.5)*app.k,...
                        squeeze(app.INSILICO(2:end, app.var_to_plot,:))',...
                        'r:', 'LineWidth', 1.5);
                end

                FigureBatch.NextPlot = 'add';

                 plot_obj2 = plot(FigureBatch,...
                    app.t0 + (0:app.T_bar-1)*app.m,...
                    squeeze(app.real_batches(1,app.var_to_plot,:))',...
                    'k-', 'LineWidth',1.5);

                

                if(app.N_real > 1)
                    plot(FigureBatch,...
                        app.t0 + (0:app.T_bar-1)*app.m,...
                        squeeze(app.real_batches(2:end,app.var_to_plot,:))',...
                        'k-', 'LineWidth',1.5);
                end

                FigureBatch.XLim = app.t0 + [0 app.T_bar-1]*app.m;

                legend(FigureBatch, [plot_obj, plot_obj2], {'In-silico','Real'},"AutoUpdate","on");

            end

            if(strcmp(app.type_to_plot, 'I'))
                plot_obj = plot(FigureBatch,...
                    app.t0 + (0.5 : 1 : app.T-.5)*app.k,...
                    squeeze(app.INSILICO(:,app.var_to_plot,:))',...
                    'r:', 'LineWidth', 1.5);

                FigureBatch.XLim = app.t0 + [0.5 app.T-.5]*app.k;

                legend(FigureBatch, plot_obj, 'In-silico');
            end

            if(strcmp(app.type_to_plot, 'IC'))
                ind_cov_vec = get_ind_cov(app);
                plot_obj = plot(FigureBatch, ...
                    app.t0 + (0.5 : 1 : app.T-.5)*app.k,...
                    ind_cov_vec, 'b');

                FigureBatch.XLim = app.t0 + [0.5 app.T-.5]*app.k;

                legend(FigureBatch, plot_obj, 'Indicator');
            end

            app.indicators_text.Visible = strcmp(app.type_to_plot, 'IC');
            app.ForegroundSwitch.Visible = strcmp(app.type_to_plot, 'RI');
            app.ForegroundSwitchLabel.Visible =...
                app.ForegroundSwitch.Visible;
            app.ForegroundSwitch.Value = 'In-silico';

            FigureBatch.XLabel.String = ['Time [' app.meas_units ']'];

            FigureBatch.YLabel.String =...
                app.variables_names(app.var_to_plot);


            FigureBatch.NextPlot = 'replacechildren';

end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0