function v_approx =...
                approx_dens(~, z_interv, samples, num_rect)

        % Given samples contained in sorted_x, this functions seeks a continuous
        % probability density function from which they could come from.
        % z_interv is the reference interval in which the reconstruction must
        % be performed
        % 'samples' contains samples of the density
        % S is the established number of bins
        % v_approx contains the values in z_interv of the reconstructed density
            
            z_first = z_interv(1);
            z_second = z_interv(end);
            v_approx = zeros(1, length(z_interv));
            
            for s = 1:num_rect
                
                lim_1 = z_first + (s-1)*(z_second-z_first)/num_rect;
                lim_2 = z_first + s*(z_second-z_first)/num_rect;
                v_approx((z_interv >= lim_1)&(z_interv < lim_2)) =...
                    sum((samples >= lim_1).*(samples < lim_2));
        
            end
        
            v_approx = v_approx/sum(v_approx);
            v_approx = v_approx/(z_interv(2)-z_interv(1));

        end

        %Copyright 2023 of GlaxoSmithKline. All rights reserved.
        %License identifier: Apache-2.0