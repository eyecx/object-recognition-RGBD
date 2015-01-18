function dispEx()

classes = {'cabinet', 'chair', 'table', 'window', 'door', 'bottle', 'box', 'lamp', 'pillow', 'bag', 'counter', 'bed', 'sofa', 'book', 'clothes', 'light', 'cup', 'garbage bin', 'desk', 'sink', 'faucet', 'blinds'};
load(fullfile('/home/edmund/data/trainClassMapping.mat'), 'myClassName');

for i = 1:length(classes)
    idx = find(ismember(myClassName, classes{i}));
    load(fullfile('/home/edmund/data', 'counts', ['cc_' int2str(idx) '.mat']));
    disp(sprintf('class:     %s\nnumTrain:  %d\nnumTest:   %d\n', classes{i}, obj.numTrain, obj.numTest));
end