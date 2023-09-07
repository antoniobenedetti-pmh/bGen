  function [T2, Q, nPC, app] = do_PCA(app, X)

            % This function performs the PCA over the input matrix X

            [X_auto, ~, ~] = do_auto(app, X);
            
            exp_var_01 = 0;
            nPC = 0;

%             app.perc.Visible = 1;
%             app.perc_label.Visible = 1;
%             pause(1e-5);

            % We need to remove zero columns


            sums = sum(X_auto.^2);
            X_auto = X_auto(:, sums > 0);
            E = X_auto;

            N = size(X, 1);
            V = size(X, 1);
            A = min([N V]);
            S = zeros(N, A);

            while(exp_var_01 < app.exp_var_th/100)

                nPC = nPC+1;

                [t, ~, E] = nipals(app, E);

                S(:, nPC) = t;

                exp_var_01 = 1-sum(E(:).^2)/sum(X_auto(:).^2);

%                 new_perc =...
%                     floor(exp_var_01*100/(50+2*(app.num_rect_max+1))*100);

%                 if(new_perc > app.perc.Value)
%                    app.perc.Value = new_perc;
% %                     pause(1e-9);
%                 end
            end

            S = S(:, 1:nPC);
            
            
            N = size(X_auto, 1);
            T2 = zeros(N, 1);
            Q = zeros(N, 1);
            
            eigs = diag(cov(S));
            
            for n = 1:N
            
                T2(n) = sum( (S(n, :).^2)./(eigs') );
                Q(n) = sum(E(n, :).^2);
            
            end

  end

  %Copyright 2023 of GlaxoSmithKline. All rights reserved.
  %License identifier: Apache-2.0