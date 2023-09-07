function [v_approx, num_rect, delta, v_true, z_interv, app] = approx_F(app, T2, A)

            % This function computes an approximation of a F distribution
            % basing on the T2 values which are provided (A = no. of
            % principal components of the related PCA model)

            max_T2 = max(T2);
            min_T2 = min(T2);

            if(max_T2 > min_T2)

                if(floor(min_T2) == min_T2)
                    min_T2 = min_T2 - 1;
                end
                if(ceil(max_T2) == max_T2)
                    max_T2 = max_T2 + 1;
                end
            
                z_interv = linspace(floor(min_T2), ceil(max_T2),...
                    app.num_z);
        
                N = length(T2);
                g = A*(N-1)/(N-A); % *((N-A-2)/(N-2));
                h = A;

                cond = (g > 0 && g < Inf && (~isnan(g)) && h < N);
        
                if(cond)
                    v_true = 1/g*fpdf(z_interv/g, h, N-h);
        
                    [v_approx, num_rect, delta, app] = ...
                        get_best_approx(app, z_interv, v_true, T2);

                else

                    v_approx = NaN*ones(1, app.num_z);
                    num_rect = 0;
                    delta = Inf;
                    v_true = NaN*ones(1, app.num_z);

                end


            else

                % This is the limit case in which all the Hotelling's T2
                % are equal

                if(floor(min_T2) == min_T2)
                    min_T2 = min_T2 - 1;
                    max_T2 = max_T2 + 1;
                end

                z_interv = linspace...
                    (floor(min_T2), ceil(max_T2), app.num_z);
                v_approx = NaN*ones(1, app.num_z);
                num_rect = 0;
                delta = Inf;
                v_true = NaN*ones(1, app.num_z);

            end

        end

        %Copyright 2023 of GlaxoSmithKline. All rights reserved.
        %License identifier: Apache-2.0
