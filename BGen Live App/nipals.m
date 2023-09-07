function [t, p, E] = nipals(app, X)

            % This function calculates the first principal component of the
            % matrix X
      
            diff = Inf;
            t = X(:,1);
            N = length(t);
            diff_th = chi2inv(app.conf_nipals, N);
            num_iter = 0;

            while(diff > diff_th && num_iter <= app.iter_nipals)
%                 diff
                p = ((t'*X)/(t'*t))';
                p = p/norm(p);
                t_new = X*p/(p'*p);
                diff = sum((t-t_new).^2);
                t = t_new;
                num_iter = num_iter + 1;
            end
       
            E = X-t*p';
        
end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0