function gprMdl = training_function(app)

            % This function performs all is needed for the training of the
            % state space model representing the batch process at issue
   
            K_indexes = partitioning_along_T_and_J_non_fixed_K(app);

            gprMdl = cell(app.T,1);

            count = app.N_real;

            if(~app.InterruptButton.Value)

                t = 1;
        
                while(t <= app.T)
                
                    gprMdl{t} = cell(app.n_var, 1);
            
                    for v = 1:app.n_var                       
                        L = app.L_matr(v, t);
                        K_vec = zeros(app.N_real*2*(L+1), 1);
                        num_el = 0;
                        for n = 1:app.N_real
                            add_length = length(K_indexes{n, v, t});
                            K_vec(num_el + 1:num_el + add_length) =...
                                K_indexes{n, v, t};
                            num_el = num_el + add_length;
                        end
                        K_vec = K_vec(1:num_el);
            
                        if(app.L_matr(v, t) == 0)
                            gprMdl{t}{v} = prior_learning(app, v, t, K_vec);
                        else
                            gprMdl{t}{v} = dynamics_learning...
                                (app, v, t, K_vec);
                        end
            
                    end
    
                    count = count+1;
                    t = t+1;
    
                end

            end

end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0
