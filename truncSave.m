function truncSave

load('/work4/edmundye/data/nyu_depth_v2_labeled.mat', 'images', 'labels', 'instances');
images = images(46:470,41:600,:,:);
labels = labels(46:470,41:600,:);
instances = instances(46:470,41:600,:);
save('/work4/edmundye/data/nyu_depth_trunc.mat', 'images', 'labels', 'instances', '-v7.3')