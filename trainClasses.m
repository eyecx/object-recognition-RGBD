function trainClasses(labels, instances, origName, trainNdxs)

c = const(0);
myClassName = {};
myClass = zeros(1, length(origName));

for i = 1:length(origName)
    found = 0;
    for j = 1:size(labels, 3)
        if isempty(find(trainNdxs==j, 1))
            continue;
        end
        if ~isempty(find(labels(:,:,j)==i, 1))
            found = 1;
            break;
        end
    end
    if found
        l = length(myClassName);
        myClassName{l+1} = origName{i};
        myClass(i) = l+1;
    else
        myClass(i) = 0;
    end
end

save(fullfile(c.data, 'trainClassMapping.mat'), 'myClass', 'myClassName');