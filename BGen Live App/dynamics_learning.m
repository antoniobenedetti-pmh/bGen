function gprMdl_t_v = dynamics_learning(app, v, t, K_vec)

            % This functions learns the state space model in the general
            % case

            gprMdl_t_v = cell(3,1);

            L = app.L_matr(v, t);
        
            X = bwu(app, app.Z(K_vec, v, t-L:t-1));
            [X, mean_X, std_X] = do_auto(app, X);
            gprMdl_t_v{2} = cell(2,1);
            gprMdl_t_v{2}{1} = mean_X;
            gprMdl_t_v{2}{2} = std_X;
        
        
            y = bwu(app, app.Z(K_vec, v, t));
            [y, mean_y, std_y] = do_auto(app, y);
            gprMdl_t_v{3} = cell(2,1);
            gprMdl_t_v{3}{1} = mean_y;
            gprMdl_t_v{3}{2} = std_y;
        
        
            [eta0, alpha0, sigma0] = get_hyp0(app, X, y);
            
            if( sum( isnan([eta0 alpha0 sigma0]) ) == 0 )
                gprMdl_t_v{1} =...
                    fitrgp(X, y,...
                    'KernelFunction','squaredexponential',...
                    'KernelParameters', [eta0; alpha0], 'Sigma', sigma0);
            else
                gprMdl_t_v{1} =...
                    fitrgp(X, y,...
                    'KernelFunction','squaredexponential');
            end
            
end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0
