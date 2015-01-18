function [labels, instances] = getMappedLabelInstance()

c = const();

try
    load(c.mappedLabel);
catch err  
    load(c.nyu, 'labels', 'instances');
    load(c.mapping, 'myClass');
    for i = 1:c.numImages;
        imageLabels = labels(:,:,i);
        imageInstances = instances(:,:,i);
        
        %convert original class labels to my classes
        z = imageLabels==0; % can't index zero into myClass
        imageLabels(z) = 1;
        imageLabels = arrayfun(@(l) myClass(l), imageLabels);
        imageLabels(z) = 0;
        imageInstances(imageLabels==0) = 0;
        
        labels(:,:,i) = imageLabels;
        instances(:,:,i) = imageInstances;
        
        save(fullfile(c.data, 'progress.mat'), 'i');
    end
    save(c.mappedLabel, 'labels', 'instances');
end