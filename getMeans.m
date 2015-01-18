function means = getMeans()

c = const();

try
    load(c.normalMeans);
catch err
    load(c.splits);
    numClusters = 36;
    s = zeros(c.x * c.y * length(trainNdxs), 3);
    
    normals = getAllNormals();

    current = 0;
    for i = 1:c.numImages
        if ismember(i, trainNdxs)
            current = current + 1;
            n = normals(:,:,:,i);
            s((current-1)*c.x*c.y+1:current*c.x*c.y,:) = [reshape(n, c.x*c.y, 3)];
        end
    end
    
    s(find(isnan(s(:,1))),:) = [];
    s = s(any(s,2),:);
    
    s = s(1:1000:end, :);
    [~, means] = kmeans(s, numClusters);
    for i = 1:size(means, 1);
        means(i,:) = means(i,:)/norm(means(i,:));
    end
    save(c.normalMeans, 'means', 's', '-v7.3');
end