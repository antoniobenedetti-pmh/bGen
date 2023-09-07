function gprMdl_t_v = prior_learning(app, v, t, K_vec)

            % This function learns the state space model when the value at
            % the current time instant does not depend on the previous ones

            gprMdl_t_v = cell(2,1);
        
            gprMdl_t_v{1} = mean(app.Z(K_vec, v, t));
            gprMdl_t_v{2} = std(app.Z(K_vec, v, t));

end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0