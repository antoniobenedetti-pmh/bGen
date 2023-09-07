 function C = get_C_coeff(~, Jv, kv, hv)
            % This function calculates the auxiliary coefficients the
            % estimation of J

            l_vec = 0:hv-1;
            num = 1-l_vec/kv;
            den = 1-l_vec/hv;
            
            C_log =...
                sum(log(num))-sum(log(den)) + (Jv-hv)*(log(hv)-log(kv));
            C = exp(C_log);

 end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0