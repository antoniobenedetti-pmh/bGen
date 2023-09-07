function corr_tau = get_corr_t(app, v, t, L_prec)

            % This function estimates the time correlation between the
            % value in the time instant t and the precedent ones (from the
            % t-0 to t-(L_prec+1)), all related to the variable v

            corr_tau = zeros(L_prec+2, 1);
            X = squeeze(app.Z(:,v,:));
            a = X(:, t);
            [a, means, stds] = do_auto(app, a);
            n = length(a);
        
            for tau = 0:L_prec+1
                b = do_scale(app, X(:, t-tau), means, stds);
                if(norm(a) > 0 && norm(b) > 0)
                    corr_tau(tau+1) = abs(a'*b)/sqrt(n-1)/norm(b);
                else
                    corr_tau(tau+1) = (tau==0);
                end
            end
            
end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0