function data_2 = truncate(app, data)

            % This function truncates the real batches data variable-wise
            % unfolded in the matrix data

            data_2 = zeros(app.N_real*app.T_bar, app.n_var);

            row = 0;

            for n = 1:app.N_real

                data_2((n-1)*app.T_bar + 1 : n*app.T_bar, :) = ...
                    data(row + 1 : row + app.T_bar, :);

                row = row + app.T_bars_orig(n);

            end

end   

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0