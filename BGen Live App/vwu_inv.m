function X = vwu_inv(~, Xv, T_temp)

            % This function performs the inverse of the variable-wise
            % unfolding procedure of the 2D matrix Xv (time length is
            % considered to be T_temp)

            % Xv is NT*V
            % X is N*V*T
            
            N = size(Xv,1)/T_temp;
            V = size(Xv,2);
        
            X = zeros(N,V,T_temp);
        
            for n = 1:N
                X(n,:,:) = Xv((n-1)*T_temp+1:n*T_temp,:)';
            end

        end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0