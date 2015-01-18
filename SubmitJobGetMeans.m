function SubmitJobGetMeans()

%Job Details
clear jobString;
jobString = {};
logDir = '/work4/edmundye/data/logs';
codeDir = '/home/eecs/edmundye/psiCode';
nodes = 1;
ppn = 1;
mem = 4; %in gigs
hh = 72; %in hours
notif = false;
minJobs = 5;
maxJobs = 5;
username = 'edmundye';
jobName = 'km2';

jobString = cell(5);

patches = [3 7 11 21 31];

for i = 1:5
    jobString{i} = sprintf('initConst(1, 1, 1, %d, 1, 1); getMeans();', patches(i));
end

pbsRunFunctions(jobName, logDir, codeDir, nodes, ppn, mem, hh, jobString, notif, minJobs, maxJobs, username);