function [Z, all_diff] = stratified_resampling(app)

            % This function performs the stratified resampling
                                                      
            Z = zeros(app.J, app.n_var, app.T);
            
            u = zeros(app.N_real, app.J/app.N_real, app.T);
          
            tau = app.samp;

            all_diff = 1;
                                
            for n = 1:app.N_real
                % for each of the N_real batches
                for t = 1:app.T
                    % for each time instant of the trajectory to be
                    % obtained
                    u(n,:,t) =...
                        randi([(t-1)*tau+1, t*tau],...
                        app.J/app.N_real, 1);
                    
                    Z((n-1)*app.J/app.N_real+1:n*app.J/app.N_real,...
                        :, t) =...
                        squeeze(app.real_batches(n, :, u(n,:,t)))';

                    vec = unique(squeeze(u(n,:,t)));
                    all_diff = all_diff && ( length(vec) == tau );

                end
            end

end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0