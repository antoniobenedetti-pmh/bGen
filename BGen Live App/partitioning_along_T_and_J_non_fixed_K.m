function K_indexes =...
            partitioning_along_T_and_J_non_fixed_K(app)

            % This function partitiones the training set along the T and
            % then the J direction in order to reduce the computational
            % cost
        
            K_indexes = cell(app.N_real, app.n_var, app.T);

            count = 0;

            n = 1;
        
            while(n <= app.N_real)
        
                for v = 1:app.n_var
        
                    for t = 1:app.T
        

                        L = app.L_matr(v, t);

                         U = squeeze...
                            (app.Z...
                            (...
                            (n-1)*app.J/app.N_real+1:n*app.J/app.N_real,...
                            v, t:-1:t-L) ...
                            );
                        [~, index_min] = min(U);
                        [~, index_max] = max(U);
                        K_vec = [index_min; index_max];
                        K_vec = K_vec(:);
        
                        K_indexes{n, v, t} = unique(K_vec)+...
                            (n-1)*app.J/app.N_real;
        
                    end
        
                end

                count = count+1;              
                n = n+1;

            end
            
end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0