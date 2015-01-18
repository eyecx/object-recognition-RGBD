function writeTrainTestImageSet(onCluster) %NYU_PASCAL moved to psiCode

c = const(onCluster);

load(fullfile(c.splits));

train = fopen(fullfile(c.data, 'NYU_PASCAL', 'VOCdevkit', 'VOC2012', 'ImageSets', 'train.txt'), 'w');
trainval = fopen(fullfile(c.data, 'NYU_PASCAL', 'VOCdevkit', 'VOC2012', 'ImageSets', 'trainval.txt'), 'w');
test = fopen(fullfile(c.data, 'NYU_PASCAL', 'VOCdevkit', 'VOC2012', 'ImageSets', 'test.txt'), 'w');

for i = 1:size(trainNdxs,1)
    fprintf(train, '%04d\n', trainNdxs(i));
    fprintf(trainval, '%04d\n', trainNdxs(i));
end

for i = 1:size(testNdxs,1)
    fprintf(test, '%04d\n', testNdxs(i));
end

fclose(train);
fclose(trainval);
fclose(test);