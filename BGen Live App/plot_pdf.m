 function plot_obj_pdf = plot_pdf(app)

            % This function allows to plot the reconstructed probability
            % density functions (pdf)
            FigurePDF=uiaxes;
            legend(FigurePDF, 'off')
            legend(FigurePDF);

            if(strcmp(app.pdf_to_plot, 'F'))
                
                z_interv_F = app.res_F{1};
                v_true_F = app.res_F{2};
                v_approx_F = app.res_F{3};
                T2 = app.res_F{5};

                plot_obj_pdf = plot(FigurePDF, z_interv_F, v_true_F,...
                    'DisplayName', 'Theoretical');
                FigurePDF.NextPlot = 'add';
                plot(FigurePDF, z_interv_F, v_approx_F,...
                    'DisplayName', 'Approximated')
                for n = 1:app.N_real
                    plot(FigurePDF, T2(n), 0, 'o', 'DisplayName',...
                        ['Real batch #' num2str(n)]);
                end

                FigurePDF.XLabel.String = 'T^2';
                FigurePDF.YLabel.String =...
                    'F probability density function';
                FigurePDF.XLim = [z_interv_F(1) z_interv_F(end)];
                FigurePDF.YLimMode = 'auto';
                FigurePDF.YLim = [0 FigurePDF.YLim(2)];
            end

            if(strcmp(app.pdf_to_plot, 'chi2'))

                z_interv_chi2 = app.res_chi2{1};
                v_true_chi2 = app.res_chi2{2};
                v_approx_chi2 = app.res_chi2{3};
                Q = app.res_chi2{5};

                plot_obj_pdf =  plot(FigurePDF, z_interv_chi2, v_true_chi2,...
                    'DisplayName', 'Theoretical');
                FigurePDF.NextPlot = 'add';
                plot(FigurePDF, z_interv_chi2, v_approx_chi2,...
                    'DisplayName', 'Approximated')
                for n = 1:app.N_real
                    plot(FigurePDF, Q(n), 0, 'o', 'DisplayName',...
                        ['Real batch #' num2str(n)]);
                end

                FigurePDF.XLabel.String = 'Q';
                FigurePDF.YLabel.String =...
                    '\chi^2 probability density function';
                FigurePDF.XLim = [z_interv_chi2(1) z_interv_chi2(end)];
                FigurePDF.YLimMode = 'auto';
                FigurePDF.YLim = [0 FigurePDF.YLim(2)];
            end

            FigurePDF.NextPlot = 'replacechildren';

 end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0
