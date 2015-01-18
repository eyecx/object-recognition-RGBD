function pr = getPR(onCluster)

c = const(onCluster, 0);

pr = [];
files = what(c.cached);
numPR = 0;

for i = 1:length(files.mat)
    str = files.mat{i};
    idx = strfind(str, '_pr_test_2012.mat');
    if ~isempty(idx);
        numPR = numPR + 1;
        load(fullfile(c.cached, str), 'ap');
        pr(numPR).name = str(1:idx-1);
        pr(numPR).ap = ap;
    end
end

for i = 1:length(pr)
    disp(sprintf('%s : %f', pr(i).name, pr(i).ap));
end