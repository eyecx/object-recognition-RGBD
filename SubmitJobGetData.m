function SubmitJobGetData()

c = const();

classes = {'cabinet', 'chair', 'table', 'door', 'bottle', 'lamp', 'pillow', 'bed', 'sofa', 'shelves'};

%Job Details
clear jobString;
jobString = {};
logDir = c.logs;
codeDir = c.code;
nodes = 1;
ppn = 1;
mem = 4; %in gigs
hh = 72; %in hours
notif = false;
minJobs = length(classes);
maxJobs = length(classes);
username = 'edmundye';
jobName = 'gd';

for i = 1:length(classes)
    jobString{i} = sprintf('c = const(); addpath(genpath(c.code)); nyu_data(''%s'', %d);', classes{i}, 2012);
    disp(jobString{i});
end

pbsRunFunctions(jobName, logDir, codeDir, nodes, ppn, mem, hh, jobString, notif, minJobs, maxJobs, username);