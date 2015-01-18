clear;
c = const(0);
matObj = matfile(fullfile(c.data, 'nyu_depth_v2_labeled.mat'));
s = size(matObj,'images');
for i = 1:s(4)
    image(matObj.images(:,:,:,i));
    pause;
end