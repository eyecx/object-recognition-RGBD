function [const] = const()

global onCluster useDepth trunc patch parts components;

const.onCluster = onCluster;
const.depth = useDepth;
const.trunc = trunc;
const.patch = patch;
const.parts = parts;
const.components = components;

if useDepth
    patchmap = [3 7 11 21 31 41];
    selN = find(ismember(patchmap, patch));
    
    if isempty(selN)
        error('Invalid patch size.');
    else
        const.selN = selN;
    end
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
const.normalMeans = fullfile(const.data, ['means' int2str(patch) '.mat']);
const.normalsFolder = fullfile(const.data, ['nyu_normals_' int2str(patch)]);
const.numImages = 1449;

if useDepth
    const.addFeats = 36;
else
    const.addFeats = 0;
end

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
    const.traindata = fullfile(const.data, 'nyu_data');
    const.nyu = fullfile(const.data, 'nyu_depth_v2_labeled.mat');
    const.mappedLabel = fullfile(const.data, 'myMappedLabels.mat');
    const.workImages = fullfile(const.data, 'nyu_images');
    const.x = 640;
    const.y = 480;
end

if useDepth
    const.cached = fullfile(const.data, ['rgbd_']);
else
    const.cached = fullfile(const.data, ['rgb_']);
end

if parts
    const.cached = [const.cached 'parts_comp' num2str(components)];
else
    const.cached = [const.cached 'root_comp' num2str(components)];
end

if useDepth
    const.cached = [const.cached '_patch' num2str(patch)];
end

const.imageFolder = fullfile(const.base, 'VOCdevkit', 'VOC2012', 'Images');