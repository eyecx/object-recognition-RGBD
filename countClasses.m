function countClasses(i)

c = const();

[labels, instances] = getMappedLabelInstance();
load(c.mapping);
load(c.splits);

obj = [];
numTrain = 0;
numTest = 0;
images = {};

for j = 1:c.numImages
    imageLabels = labels(:,:,j);
    imageInstances = instances(:,:,j);
    if ~isempty(find(imageLabels==i, 1))
        images{end+1} = sprintf('%04d.jpg', j);
        [~, ls] = get_instance_masks(imageLabels, imageInstances);
        numInst = sum(ls==i);
        if isempty(find(trainNdxs==j, 1))
            numTest = numTest + numInst;
        else
            numTrain = numTrain + numInst;
        end
    end
end
obj.numTrain = numTrain;
obj.numTest = numTest;
obj.images = images;

save(fullfile(c.data, 'counts', sprintf('cc_%d.mat', i)), 'obj');