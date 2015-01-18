function getCounts(onCluster)

c = cons(onCluster, 1, 1, 3);
load(fullfile(c.data, 'trainClassMapping.mat'));

allCounts = zeros(length(myClassName), 2);

for i = 1:length(myClassName)
    load(fullfile(c.data, 'counts', strcat('cc_', int2str(i), '.mat')));
    allCounts(i,:) = [obj.numTrain obj.numTest];
end

[B, IX] = sort(allCounts, 1);

for i = 1:length(IX)
    load(fullfile(c.data, 'counts', strcat('cc_', int2str(IX(i,1)), '.mat')));
    disp(sprintf('name : %s numTrain: %d numTest: %d', myClassName{IX(i,1)}, obj.numTrain, obj.numTest));
end

%blinds, faucet