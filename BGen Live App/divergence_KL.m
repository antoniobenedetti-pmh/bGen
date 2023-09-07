function D = divergence_KL(~, p, q, z)
    
            % This function calculates the KL divergence
            % p contains the values in the vector z of the approximated density
            % q contains the values in the vector z of the true density
            % D is the KL divergence
        
            % These lines ensure that all the involved vectors are rows
            % to prevent from errors
            if(size(p, 1) > 1)
                p = p';
            end
            if(size(q, 1) > 1)
                q = q';
            end
            if(size(z, 1) > 1)
                z = z';
            end
        
            delta = z(2) - z(1);
            f = p.*log(p./q);
            f(isnan(f)) = 0;
            D = delta*( sum(f([1 end])/2) + sum(f(2:end-1)));

end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0