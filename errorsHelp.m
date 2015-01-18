function errorsHelp

initConst(1, 1, 1, 3, 1, 1);
load('/work4/edmundye/data/rgbd_parts_comp1_patch3/lamp_final.mat', 'model');
% get boxes somehow


viewerrors(model, boxes, 'test', 2012, 0);