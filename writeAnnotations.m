function writeAnnotations(a, onCluster, depth) %NYU_PASCAL moved to psiCode

c = const(onCluster, depth);

addpath(genpath(c.code));

load(c.nyu, 'images');
load(c.mapping, 'myClass', 'myClassName');
[labels, instances] = getMappedLabelInstance(onCluster, depth);

for j = 1+(a-1)*15:min([c.numImages a*15]) %length 15 jobs %for j = 1:size(instances, 3) % loop through all images
    objList = [];
    bboxes = [];
    
    imageLabels = labels(:,:,j);
    imageInstances = instances(:,:,j);
    imageSize = size(images(:,:,:,j));
    
    [instanceMasks, instanceLabels] = get_instance_masks(imageLabels,imageInstances);
    
    if isempty(instanceMasks)
        continue;
    end
    
    count = size(instanceMasks, 3);
    
    for k = 1:count
        [row, col] = find(instanceMasks(:,:,k));
        bbox = [min(col) min(row) max(col) max(row)];
        
        objList = [objList; instanceLabels(k)];
        bboxes = [bboxes; bbox];
    end
    
    writeAnnotationFile(c, j, imageSize, myClassName, objList, bboxes);
end