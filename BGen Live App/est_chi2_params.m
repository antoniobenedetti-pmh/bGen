function [g, h] = est_chi2_params(~, samples)

            % This function estimates the parameters of a chi2 distribution
            % described by the provided samples

            mu = mean(samples);
            sigma = std(samples);

            g = sigma^2/2/mu;
            h = 2*mu^2/sigma^2;

end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0