function SubmitJobCC()

%Job Details
clear jobString;
jobString = {};
logDir = '/work4/edmundye/data/logs';
codeDir = '/home/eecs/edmundye/psiCode';
nodes = 1;
ppn = 1;
mem = 2; %in gigs
hh = 72; %in hours
notif = false;
minJobs = 114;
maxJobs = 114;
username = 'edmundye';
jobName = 'cc';

jobString = cell(114);

for i = 1:114
    jobString{i} = sprintf('addpath(genpath(''/home/eecs/edmundye/psiCode/toolbox_nyu_depth_v2'')); initConst(%d,%d,%d,%d,%d,%d), countClasses(%d)', 1, 1, 1, 3, 1, 1, i);
end

pbsRunFunctions(jobName, logDir, codeDir, nodes, ppn, mem, hh, jobString, notif, minJobs, maxJobs, username);