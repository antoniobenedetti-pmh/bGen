   function MATR_2 = bound(app, MATR)

            % This function allows to bound the in-silico batches

            MATR_2 = MATR;

            for v = 1:app.n_var
                if(app.LB_set(v))
                    MATR_2(:,v,:) =...
                        max(MATR(:,v,:), app.LB_value(v));
                end
                
                if(app.UB_set(v))
                    MATR_2(:,v,:) =...
                        min(MATR_2(:,v,:), app.UB_value(v));
                end
            end

   end

   %Copyright 2023 of GlaxoSmithKline. All rights reserved.
   %License identifier: Apache-2.0