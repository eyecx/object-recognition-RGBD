t = {'A' 'dog' 200; 'B' 'cat' 99.3};
str = '';

for i = 1:2:numel(t)
    next = t{i};
    if isnumeric(next)
        next = num2str(next);
    end
    str = sprintf('%s%s\t', str, next);
end

str = sprintf('%s\n',str);

for j = 2:2:numel(t)
    next = t{i};
    if isnumeric(next)
        next = num2str(next);
    end
    str = sprintf('%s%s\t', str, next);
end

clipboard('copy', str)