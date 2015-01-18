function [const] = cons(onCluster, useDepth, trunc, patch)

patchmap = [3 7 11 21 31];
selN = find(ismember(patchmap, 7));

if isempty(selN)
    error('Invalid patch size.');
else
    const.selN = selN;
end

if onCluster
    const.code = fullfile('/home','eecs','edmundye','psiCode');
    const.data = fullfile('/work4','edmundye','data');
    const.logs = fullfile(const.data,'logs');
else
    const.code = fullfile('/home','edmund','psiCode');
    const.data = fullfile('/home','edmund','data');
end

const.normals = fullfile(const.data, ['normals' int2str(patch) '.mat' ]);
const.mapping = fullfile(const.data, 'trainClassMapping.mat');
const.splits = fullfile(const.data, 'splits.mat');
const.normalMeans = fullfile(const.data, 'means.mat');
const.normalsFolder = fullfile(const.data, ['nyu_normals_' int2str(patch)]);
const.numImages = 1449;

if trunc || useDepth
    const.base = fullfile(const.code, 'NYU_PASCAL_TRUNC');
    const.traindata = fullfile(const.data, 'nyu_data_trunc');
    const.nyu = fullfile(const.data, 'nyu_depth_trunc.mat');
    const.mappedLabel = fullfile(const.data, 'myMappedLabels_trunc.mat');
    const.workImages = fullfile(const.data, 'nyu_images_trunc');
    const.x = 560;
    const.y = 425;
else
    const.base = fullfile(const.code, 'NYU_PASCAL');
    const.traindata = fullfile(const.data, 'nyu_data')
    const.nyu = fullfile(const.data, 'nyu_depth_v2_labeled.mat');
    const.mappedLabel = fullfile(const.data, 'myMappedLabels.mat');
    const.workImages = fullfile(const.data, 'nyu_images');
    const.x = 640;
    const.y = 480;
end

if useDepth
    const.cached = fullfile(const.data, '2012_root_depth');
else
    const.cached = fullfile(const.data, '2012_root_nodepth');

end
const.imageFolder = fullfile(const.base, 'VOCdevkit', 'VOC2012', 'Images');