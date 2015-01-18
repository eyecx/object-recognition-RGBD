function writeIms

load('/work4/edmundye/data/nyu_depth_trunc.mat', 'images');

for i = 1:1449
    imwrite(images(:,:,:,i), sprintf('/work4/edmundye/data/nyu_images_trunc/%04d.jpg', i));
    disp(num2str(i));
end