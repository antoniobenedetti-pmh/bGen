 function ind_cov_vec = get_ind_cov(app)

            % This functions assesses the uniformity of the points in the
            % variability range by calculating a suitable indicator

           
%             app.perc.Visible = 1;
%             app.perc_label.Visible = 1;

            ind_cov_vec = zeros(app.T, 1);

            v = app.var_to_plot;
            X = bwu_inv(app, app.X_cal(:, v : app.n_var : ...
                (app.T-1)*app.n_var+v), ...
                app.T);

            for t = 1:app.T
                x_hat = squeeze(X(:, t));
                x_second = sort(x_hat);
                x_first = x_second-x_second(1);
                if(x_first(end) == 0)
                    ind = 1;
                else
                    x = x_first/x_first(end);
                    y = diff(x);
                    ind = 1-sum(y.^2);
                end
                ind_cov_vec(t) = ind;


            end

            
        end
%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0