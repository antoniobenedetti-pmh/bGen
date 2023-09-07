 function X_vwu = vwu(~, X)

            % This function performs the variable-wise unfolding of the
            % input 3D matrix X

            N = size(X,1);
            V = size(X,2);
            T_temp = size(X,3);
        
            X_vwu = zeros(N*T_temp, V);
        
            for n = 1:N
                X_vwu((n-1)*T_temp+1:n*T_temp, :) = squeeze(X(n,:,:))';
            end
 end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0