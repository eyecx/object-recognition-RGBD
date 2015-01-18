function n = getNormal(i)

c = const();

try
    load(fullfile(c.normalsFolder, sprintf('%04d.mat', i)));
catch err
    [u n] = sNormalsV2(i, c.selN);
    save(fullfile(c.normalsFolder, sprintf('%04d.mat', i)), 'u', 'n', '-v7.3');
end