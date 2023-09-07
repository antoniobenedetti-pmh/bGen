function [M_auto, means, stds] = do_auto(app, M)

            % This function performs the autoscaling of the matrix M
            % (column by column)

            M_auto = zeros(size(M));
            stds = std(M, 0, 1);
            means = mean(M, 1);
            indexes = find(stds > app.std_th);
            
            if(~isempty(indexes))
                M_auto(:, indexes) = (M(:, indexes) - means(indexes))./...
                    stds(indexes);
            end
            
end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0