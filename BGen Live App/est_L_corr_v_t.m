 function L = est_L_corr_v_t(app, v, t, L_prec)

            % This function estimates the parameter L for the specific
            % variable No. v and for the time instant No. t
        
            corr_tau = get_corr_t(app, v, t, L_prec);
            % from tau = 0 to tau = L_prec+1
            % The indexes corr_tau go from 1 to L_prec+2
            
            
            L = L_prec+1;
            % This instruction superiorly bounds the memory
            
            while(corr_tau(L+1) < app.delta_L(v))
                L = L-1;
            end

            if(L==0 && t>1)
                L = 1;
            end
            % This instruction imposes that the value of L is greater than
            % zero for any time instant different from the first one (that
            % is the process has memory)
        
        end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0