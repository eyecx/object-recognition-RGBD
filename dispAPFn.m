function dispAPFn(depth, parts, comp, patch)

classes = {'cabinet', 'chair', 'table', 'window', 'door', 'bottle', 'box', 'lamp', 'pillow', 'bag', 'counter', 'bed', 'sofa', 'book', 'clothes', 'light', 'cup', 'garbage bin', 'desk', 'sink', 'faucet', 'blinds'};
load(fullfile('/home/edmund/data/trainClassMapping.mat'), 'myClassName');

folder = '/home/edmund/data/rgb';

if depth
    folder = [folder 'd'];
end

if parts
    folder = [folder '_parts_'];
else
    folder = [folder '_root_'];
end

folder = [folder 'comp' num2str(comp)];

if patch
    folder = [folder '_patch' num2str(patch)];
end

for i = 1:length(classes)
    try
        idx = find(ismember(myClassName, classes{i}));
        load(fullfile('/home/edmund/data', 'counts', ['cc_' int2str(idx) '.mat']));
        fprintf('class:\t\t%s\nnumTrain:\t%d\nnumTest:\t%d\n', classes{i}, obj.numTrain, obj.numTest);
        fprintf('depthAP:\t');
        load([folder '/' classes{i} '_pr_test_2012.mat'], 'ap');
        fprintf([num2str(ap) '\n\n']);
    catch err
        fprintf('\n\n');
    end
end