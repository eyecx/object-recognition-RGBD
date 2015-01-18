function viewErr
%cls = 'lamp';
initConst(1, 1, 1, 3, 1, 1);
addpath(genpath('/home/eecs/edmundye/psiCode/voc-release5'));
addpath(genpath('/home/eecs/edmundye/psiCode/NYU_PASCAL_TRUNC'));
startup;
load('/work4/edmundye/data/rgbd_parts_comp1_patch3/lamp_boxes_test_2012.mat', 'ds');
load('/work4/edmundye/data/rgbd_parts_comp1_patch3/lamp_final.mat', 'model');
viewerrors(model, ds, 'test', '2012', 0);