function [v_approx, num_rect, delta, app] = ...
            get_best_approx(app, z_interv, v_true, samples)

            % This function works as follows
            % v_true are the true values of the density to be reconstructed
            % in the interval z_interv
            % The density must be reconstructed from samples

            delta_vec = zeros(app.num_rect_max, 1);

            if(strcmp(app.curr_pdf, 'F'))
                count = 0;
                app.perc_do_PCA = app.perc.Value;
            else
                count = app.num_rect_max+1;
            end
    
            for S = 1:app.num_rect_max
               
                v_approx = approx_dens(app, z_interv, samples, S);
                delta_vec(S) = divergence_KL(app, ...
                    v_approx, v_true, z_interv);

                count = count+1;
            end
    
            [delta, num_rect] = min(delta_vec);
            if(isnan(delta))
                delta = Inf;
            end
            v_approx = approx_dens(app, z_interv, samples, num_rect);

            count = count+1;

end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0