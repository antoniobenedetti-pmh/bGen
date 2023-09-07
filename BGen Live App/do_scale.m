function M_scaled = do_scale(app, M, means, stds)

            % This function scales the matrix M according the given means
            % row vector and stds standard deviations vector

            M_scaled = zeros(size(M));
            indexes = find(stds > app.std_th);
            if(~isempty(indexes))
                M_scaled(:, indexes) = (M(:, indexes) - means(indexes))./...
                    stds(indexes);
            end

end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0