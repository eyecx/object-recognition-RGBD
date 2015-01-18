function visualizeNormals()

matObj3 = matfile('/home/edmund/data/normals3.mat');
load('/home/edmund/data/means_10_3.mat');
m3 = sort(means,1);

matObj7 = matfile('/home/edmund/data/normals7.mat');
load('/home/edmund/data/means_10_7.mat');
m7 = sort(means,1);

matObj11 = matfile('/home/edmund/data/normals11.mat');
load('/home/edmund/data/means_10_11.mat');
m11 = sort(means,1);

matObj21 = matfile('/home/edmund/data/normals21.mat');
load('/home/edmund/data/means_10_21.mat');
m21 = sort(means,1);

matObj31 = matfile('/home/edmund/data/normals31.mat');
load('/home/edmund/data/means_10_31.mat');
m31 = sort(means,1);

numMeans = 10;

group = transpose(1:length(means));
for i = 411:1449    
    orig = imread(sprintf('/home/edmund/data/nyu_images_trunc/%04d.jpg', i));
    subplot(2,3,1);
    imshow(orig);
    
    normal = matObj31.normals(:,:,:,i);
    classes31 = reshape(...
        knnclassify(...
        [reshape(normal(:,:,1), 425*560, 1) reshape(normal(:,:,2), 425*560, 1) reshape(normal(:,:,3), 425*560, 1)],...
        m31, group, 1, 'cosine'),...
        425, 560);
    subplot(2,3,2);
    f31 = classes31/numMeans;
    imshow(f31);
    
    normal = matObj21.normals(:,:,:,i);
    classes21 = reshape(...
        knnclassify(...
        [reshape(normal(:,:,1), 425*560, 1) reshape(normal(:,:,2), 425*560, 1) reshape(normal(:,:,3), 425*560, 1)],...
        m21, group, 1, 'cosine'),...
        425, 560);
    subplot(2,3,3);
    f21 = classes21/numMeans;
    imshow(f21);
    
    normal = matObj11.normals(:,:,:,i);
    classes11 = reshape(...
        knnclassify(...
        [reshape(normal(:,:,1), 425*560, 1) reshape(normal(:,:,2), 425*560, 1) reshape(normal(:,:,3), 425*560, 1)],...
        m11, group, 1, 'cosine'),...
        425, 560);
    subplot(2,3,4);
    f11 = classes11/numMeans;
    imshow(f11);
    
    normal = matObj7.normals(:,:,:,i);
    classes7 = reshape(...
        knnclassify(...
        [reshape(normal(:,:,1), 425*560, 1) reshape(normal(:,:,2), 425*560, 1) reshape(normal(:,:,3), 425*560, 1)],...
        m7, group, 1, 'cosine'),...
        425, 560);
    subplot(2,3,5);
    f7 = classes7/numMeans;
    imshow(f7);
    
    normal = matObj3.normals(:,:,:,i);
    classes3 = reshape(...
        knnclassify(...
        [reshape(normal(:,:,1), 425*560, 1) reshape(normal(:,:,2), 425*560, 1) reshape(normal(:,:,3), 425*560, 1)],...
        m3, group, 1, 'cosine'),...
        425, 560);
    subplot(2,3,6);
    f3 = classes3/numMeans;
    imshow(f3);
    
    resp = input('', 's');
    if strcmp(resp, 'q')
        break;
    end
    if strcmp(resp, 's')
        imwrite(uint8(round(f3*255)), sprintf('/home/edmund/thesis/images/%d_3.jpg',i), 'jpeg');
        imwrite(uint8(round(f7*255)), sprintf('/home/edmund/thesis/images/%d_7.jpg',i), 'jpeg');
        imwrite(uint8(round(f11*255)), sprintf('/home/edmund/thesis/images/%d_11.jpg',i), 'jpeg');
        imwrite(uint8(round(f21*255)), sprintf('/home/edmund/thesis/images/%d_21.jpg',i), 'jpeg');
        imwrite(uint8(round(f31*255)), sprintf('/home/edmund/thesis/images/%d_31.jpg',i), 'jpeg');
    end
end