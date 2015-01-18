% load('/home/edmund/data/means31.mat');
% newMeans = [];
% for i = 1:size(means,1)
%     newMeans(i,:,:) = means(i,:);
% end
% 
% visualizeNormals2(newMeans);

matObj = matfile('/home/edmund/data/nyu_depth_v2_labeled.mat');
d = matObj.depths(:,:,2);
imagesc(visualizeNormals(d));