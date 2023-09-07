function L_matr = est_L_corr(app)

            % This function returns a 2D matrix containing the parameter L
            % for each variable and for each time instant

            L_matr = zeros(app.n_var, app.T);
        
            for v = 1:app.n_var
        
                L_vec = est_L_corr_v(app, v);
                L_matr(v, :) = L_vec;

        
            end

        end


%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0