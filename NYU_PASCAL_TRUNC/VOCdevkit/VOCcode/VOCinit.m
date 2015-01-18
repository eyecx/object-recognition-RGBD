clear VOCopts

global useDepth patch parts components;

% get current directory with forward slashes

cwd=cd;
cwd(cwd=='\')='/';

% change this path to point to your copy of the PASCAL VOC data
VOCopts.datadir=[cwd '/'];

% change this path to a writable directory for your results
VOCopts.resdir=[cwd '/results/'];

% change this path to a writable local directory for the example code
VOCopts.localdir=[cwd '/local/'];

% initialize the test set

%VOCopts.testset='val'; % use validation data for development test set
VOCopts.testset='test'; % use test set for final challenge

% initialize paths

% VOCopts.imgsetpath=[VOCopts.datadir 'VOC2007/ImageSets/%s.txt'];
% VOCopts.clsimgsetpath=[VOCopts.datadir 'VOC2007/ImageSets/%s_%s.txt'];
% VOCopts.annopath=[VOCopts.datadir 'VOC2007/Annotations/%s.txt'];
% VOCopts.imgpath=[VOCopts.datadir 'VOC2007/Images/%s.png'];
VOCopts.imgsetpath=[VOCopts.datadir 'VOC2012/ImageSets/%s.txt'];
VOCopts.clsimgsetpath=[VOCopts.datadir 'VOC2012/ImageSets/%s_%s.txt'];
VOCopts.annopath=[VOCopts.datadir 'VOC2012/Annotations/%s.txt'];
VOCopts.imgpath=[VOCopts.datadir 'VOC2012/Images/%s.jpg'];

VOCopts.clsrespath=[VOCopts.resdir '%s_cls_' VOCopts.testset '_%s.txt'];
% VOCopts.detrespath=[VOCopts.resdir '%s_det_' VOCopts.testset '_%s.txt'];

str = '';
if useDepth
    str = fullfile(str, ['rgbd_']);
else
    str = fullfile(str, ['rgb_']);
end

if parts
    str = [str 'parts_comp' num2str(components)];
else
    str = [str 'root_comp' num2str(components)];
end

if useDepth
    str = [str '_patch' num2str(patch)];
end

VOCopts.detrespath=[VOCopts.resdir str '%s_det_' VOCopts.testset '_%s.txt'];

% initialize the VOC challenge options

VOCopts.classes={'inriaperson'};
VOCopts.nclasses=length(VOCopts.classes);	

VOCopts.minoverlap=0.5;

% initialize example options

VOCopts.exfdpath=[VOCopts.localdir '%s_fd.mat'];
