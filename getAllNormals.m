function normals = getAllNormals()

c = const();

try
    load(c.normals, 'normals');
catch err
    normals = zeros(425, 560, 3, c.numImages);
    
    for j = 1:c.numImages
        n = getNormal(j);
        normals(:,:,:,j) = n;
    end
    
    save(c.normals, 'normals', '-v7.3');
end