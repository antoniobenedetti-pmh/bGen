function [new_trajs,app] = generate_many_insilico_trajectories(app)

            % This function generates R_per_iter in-silicot trajectories 

            new_trajs = zeros(app.R_per_iter, app.n_var, app.T);

%             app.perc.Visible = 1;
%             app.perc_label.Visible = 1;
%         
            for t = 1:app.T
        
                for v = 1:app.n_var
        
                    if(app.L_matr(v, t) == 0)
        
                       new_trajs(:, v, t) = app.gprMdl{t}{v}{1} + ...
                            app.gprMdl{t}{v}{2}*randn(app.R_per_iter, 1);
        
                    else
        
                        new_trajs_scaled =...
                            do_scale...
                            (app,...
                            bwu(app, new_trajs(:, v, t-app.L_matr(v, t):t-1)),...
                            app.gprMdl{t}{v}{2}{1},...
                            app.gprMdl{t}{v}{2}{2} ...
                            );
            
                        [mean_pred, std_pred] =...
                            predict(app.gprMdl{t}{v}{1}, new_trajs_scaled);
            
                        new_trajs(:, v, t) =...
                            (mean_pred +...
                            std_pred.*randn(app.R_per_iter, 1))*...
                            app.gprMdl{t}{v}{3}{2} + ...
                            app.gprMdl{t}{v}{3}{1};
        
                    end


        
                end
        
            end



end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0
