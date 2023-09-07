function [T_bar_est, T_bars] = get_T_bar(~, column)

            % This function calculates the shortest length among the
            % batches identified by the ID batches in the provided column.
            % Secondly, this function returns the single lengths.

            flag_cell = isa(column(1), 'cell');

            n = length(column);

            T_bars = zeros(0, 1);
            p = 1;

            T_bar_est = Inf;
            row = 1;

            while(row <= n)

                curr_start_row = row;
                x = column(curr_start_row);
                if(flag_cell)
                    x = cell_to_str([],x);
                end

                check = 1;
                while(row <= n && check)

                    if(flag_cell)
                        check = strcmp(cell_to_str([],column(row)), x);
                    else
                        check = (column(row) == x);
                    end
    
                    row = row + check;

                end

                row = row - 1;
                T_bar_curr = row - curr_start_row + 1;

                T_bars(p) = T_bar_curr;
                p = p+1;

                if(T_bar_curr < T_bar_est)
                    T_bar_est = T_bar_curr;
                end

                row = row + 1;

            end

end

%Copyright 2023 of GlaxoSmithKline. All rights reserved.
%License identifier: Apache-2.0