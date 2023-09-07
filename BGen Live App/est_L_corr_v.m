 function L_vec = est_L_corr_v(app, v)

            % This function retuns a row vector containing the parameter L
            % for the specific variable No. v and for each time instant

            L_vec = zeros(1, app.T);
            L_prec = -1;
            for t = 1:app.T
        
%                 [v t]
        
                L_vec(t) = est_L_corr_v_t(app, v, t, L_prec);
                L_prec = L_vec(t);
            end

        end


%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0