function dispPatchesAp()

classes = {'cabinet', 'chair', 'table', 'window', 'door', 'bottle', 'box', 'lamp', 'pillow', 'bag', 'counter', 'bed', 'sofa', 'book', 'clothes', 'light', 'cup', 'garbage bin', 'desk', 'sink', 'faucet', 'blinds'};
load(fullfile('/home/edmund/data/trainClassMapping.mat'), 'myClassName');

patches = [3 7 11 21 31];

for i = 1:length(classes)
    idx = find(ismember(myClassName, classes{i}));
    load(fullfile('/home/edmund/data', 'counts', ['cc_' int2str(idx) '.mat']));
    fprintf('class:\t\t%s\nnumTrain:\t%d\nnumTest:\t%d\n', classes{i}, obj.numTrain, obj.numTest);
    fprintf('depthAP:\t');
    for j = 1:length(patches);
        try
            load(['/home/edmund/data/2012_root_depth_' num2str(patches(j)) '/' classes{i} '_pr_test_2012.mat'], 'ap');
            fprintf([num2str(ap) '      ']);
        catch err
        end
    end
    %load(['/home/edmund/data/2012_root_nodepth_41/' classes{i} '_pr_test_2012.mat'], 'ap');
    %fprintf(['\nnodepthAP:\t' num2str(ap) '\n\n']);
end