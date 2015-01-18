function makeTable(t, invert)
% takes cell array t, copies the table so it can be inserted into lyx table
% with ctrl shift v

disp(sprintf('rows:%d \tcols:%d', size(t,1), size(t,2)));

str = '';
col = size(t, 1);
for i = 1:col
    for j = i:col:numel(t)
        next = t{j};
        if isnumeric(next)
            next = num2str(next, 3);
        end
        str = sprintf('%s%s\t', str, next);
    end
    str = sprintf('%s\n',str);
end

clipboard('copy', str)