function SubmitJobWriteMapping()

%Job Details
clear jobString;
jobString = {};
logDir = '/home/eecs/edmundye/logs';
codeDir = '/home/eecs/edmundye/psiCode';
nodes = 1;
ppn = 1;
mem = 8; %in gigs
hh = 72; %in hours
notif = false;
minJobs = 1;
maxJobs = 1;
username = 'edmundye';
jobName = 'map';

jobString = cell(1);

jobString{1} = sprintf('getMappedLabelInstance(1)');


pbsRunFunctions(jobName, logDir, codeDir, nodes, ppn, mem, hh, jobString, notif, minJobs, maxJobs, username);
