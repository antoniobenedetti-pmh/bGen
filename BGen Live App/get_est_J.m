 function J_est = get_est_J(app)

            % This function calculates an estimation of the parameter J
            % (for a single batch) accordingly to the set parameters 

            % kbar: number of points
            % prob: probability to sample everyone in a single resampling
            % interval
            % maxJ: maximum number for J

            kv = app.samp;
            maxJ = app.max_J_per_batch;

            if(kv > maxJ)

                J_est = maxJ;

            else

                prob = app.p_J^(1/(app.N_real*app.T));
    
                pp = 0;
                J_est = kv;
    
                while ( J_est <= maxJ && pp < prob )
    
                    pp = 0;
                    for hv = 1:kv-1
                        pp = pp + get_C_coeff(app, J_est, kv, hv);
                    end
                    pp = max([0 1-pp]);
                    % to prevent from numerical problems
    
                    J_est = J_est + 1;
%                     app.perc.Value = floor(max([J_est/maxJ pp/prob])*100);
%                     pause(1e-9);
    
    
                end
    
                J_est = J_est-1;

            end

            if(J_est <= 1)
                J_est = 2;
            end

        end
        
%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0
        