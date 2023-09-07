 function [v_approx, num_rect, delta, v_true, z_interv, app] = ...
            approx_chi2(app, Q)

            % This function computes an approximation of a chi2 distribution
            % basing on the Q values which are provided

            max_Q = max(Q);
            min_Q = min(Q);

            if(max_Q > min_Q)
            
                z_interv =...
                    linspace(min_Q/2,...
                    max_Q + min_Q/2, app.num_z);
        
                [g, h] = est_chi2_params(app, Q);
        
                v_true = 1/g*chi2pdf(z_interv/g, h);
        
                [v_approx, num_rect, delta, app] = ...
                    get_best_approx(app, z_interv, v_true, Q);

            else

                % This is the limit case in which all the Q residuals are
                % equal

                z_interv =...
                    linspace(min_Q/2,...
                    max_Q + min_Q/2, app.num_z);
                v_approx = NaN*ones(1, app.num_z);
                num_rect = 0;
                delta = Inf;
                v_true = NaN*ones(1, app.num_z);

            end

        end

        
        
        %Copyright 2023 of GlaxoSmithKline. All rights reserved.
        %License identifier: Apache-2.0