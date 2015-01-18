function trainClassesThreshold(onCluster)

c = const(onCluster);

load(c.nyu, 'images', 'labels', 'names');

myClassName = {};
myClass = zeros(1, length(origName));

for i = 1:length(origName)
    disp(int2str(i));
    numTrain = 0;
    numTest = 0;
    for j = 1:size(labels, 3)
        if ~isempty(find(labels(:,:,j)==i, 1))
            if isempty(find(trainNdxs==j, 1))
                numTest = numTest + 1;
            else
                numTrain = numTrain + 1;
            end
            if numTrain > 10 && numTest > 10
                break;
            end
        end
    end
    if numTrain > 10 && numTest > 10
        l = length(myClassName);
        myClassName{l+1} = origName{i};
        myClass(i) = l+1;
    else
        myClass(i) = 0;
    end
end

save(c.mapping, 'myClass', 'myClassName');