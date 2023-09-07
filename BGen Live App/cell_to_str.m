function char_array = cell_to_str(~,mycell)
            % convert cell array of strings to char array
            try
                numcells = cellfun(@isnumeric,mycell);
                mycell(numcells) = cellfun(@num2str,mycell(numcells),'UniformOutput', false);
                numcells = cellfun(@islogical,mycell);
                mycell(numcells) = cellfun(@num2str,mycell(numcells),'UniformOutput', false);
            end
            char_array = '';
            cols = size(mycell,2);
            for i = 1:cols
                mycell(ismember(mycell,'')) = {' '};%Replace empty cells with spaces so they vcat correctly.
                mycol = strvcat(mycell{:,i});%Make a column.
                char_array = [char_array mycol];%Add column.
            end

        end
        
        %Copyright 2023 of GlaxoSmithKline. All rights reserved.
        %License identifier: Apache-2.0