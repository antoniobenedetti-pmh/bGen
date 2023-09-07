 function X = bwu_inv(~, Xb, Tx)

            % This function performs the inverse of the batch-wise
            % unfolding of the provided 2D matrix
    
            Nx = size(Xb,1);
            Vx = size(Xb,2)/Tx;
        
            X = zeros(Nx,Vx,Tx);
        
            for t = 1:Tx
                X(:,:,t) = Xb(:,(t-1)*Vx+1 : t*Vx);
            end

 end

 %Copyright 2023 of GlaxoSmithKline. All rights reserved.
 %License identifier: Apache-2.0