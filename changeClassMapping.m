function changeClassMapping(onCluster)

c = const(onCluster);
load(c.nyu, 'names');

numClasses = str2num(input('Number of classes:', 's'));
myClassName = cell(1, numClasses);

for i = 1:numClasses
    str = '';
    while strcmp(str, 'y')
        name = input(sprintf('Enter class %d name:', i), 's');
        str = input(sprintf('Assign class %d to %s?', i, name));
    end
    myClassName{i} = name;
end

l = length(names);
myClass = zeros(1, l)
for i = 1:l
    str = ''
    while strcmp(str, 'y')
        num = str2num(input(sprintf('Class %d (%s) assignment:', i, names{i})));
        str = input(sprintf('Assign %s to %s?', names{i}, myClassName{num}));
    end
    myClass(i) = num;
end