function X_bwu = bwu(~, X)

            % This function performs the batch-wise unfolding of the
            % provided 3D matrix

            Nx = size(X,1);
            Vx = size(X,2);
            Tx = size(X,3);

            X_bwu = zeros(Nx, Vx*Tx);

          for t = 1:Tx
                X_bwu(:, (t-1)*Vx+1:t*Vx) = X(:, :, t);
          end

end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0