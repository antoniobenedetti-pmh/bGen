 function [eta0, alpha0, sigma0] = get_hyp0(~, X, y)

            % This functions computes (when possible) an initial guess for
            % the hyperparameters for the dynamics learning
            
            K = size(X, 1);
            L = size(X, 2);
        
            d_x = zeros(L,1);
            d_y = zeros(L,1);
        
            for j = 1:L
        
               X_vect = X(:,j);
               [X_vect_sorted, indexes] = sort(X_vect);
               y_sorted = y(indexes);
        
               k_xj = 0;
               delta_xj = 0;
               k_yj = 0;
               delta_yj = 0;
        
               for i = 1:K-1
                   delta_xj =...
                       delta_xj + X_vect_sorted(i+1)-X_vect_sorted(i);
                   if(X_vect_sorted(i+1) ~= X_vect_sorted(i))
                       k_xj = k_xj+1;
                   end
        
                   delta_yj = delta_yj + abs(y_sorted(i+1)-y_sorted(i));
                   if(y_sorted(i+1) ~= y_sorted(i))
                       k_yj = k_yj+1;
                   end
               end
        
               d_x(j) = delta_xj/k_xj;
               d_y(j) = delta_yj/k_yj;
        
            end
        
            eta0 = mean(d_x);
            alpha0 = mean(d_y);
            sigma0 = .5*(alpha0+min(d_y));
                
 end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0