  function matr_2 = remove_NaN(~, matr)

            % This function removes (by interpolation or holding) the 
            % missing data in the 3D matrix matr

            Nx = size(matr, 1);
            Ny = size(matr, 2);
            Nz = size(matr, 3);

            matr_2 = matr;
            flags = isnan(matr_2);
            indexes = find(flags, Nx*Ny*Nz, 'first');

            for i = 1:length(indexes)

                [x, y, z] = ind2sub([Nx Ny Nz], indexes(i));

                if(z < Nz)
                                
                    vec = squeeze(~flags(x, y, z+1:Nz));
                    index = z + find(vec, 1, 'first');
                    if(z == 1)
                        matr_2(x, y, z) = matr_2...
                            (x, y, index);
                    else
                        num = matr_2(x, y, index) -...
                            matr_2(x, y, z-1);
                        den = index - (z-1);
                        matr_2(x, y, z) = matr_2(x, y, z-1) + ...
                            num/den;
                    end

                else

                    matr_2(x, y, z) = matr_2(x, y, z-1);

                end
            end            

        end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0