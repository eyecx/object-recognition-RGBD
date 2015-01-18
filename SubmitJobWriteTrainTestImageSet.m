function [out] = SubmitJobWriteTrainTestImageSet()

c = const(1);

addpath(genpath(c.code));

%Job Details
clear jobString;
jobString = {};
logDir = c.logs;
codeDir = c.code;
nodes = 1;
ppn = 1;
mem = 2; %in gigs
hh = 72; %in hours
notif = false;
minJobs = 1;
maxJobs = 1;
username = 'edmundye';
jobName = 'wtt';

jobString = cell(1);

jobString{1} = sprintf('writeTrainTestImageSet()');

pbsRunFunctions(jobName, logDir, codeDir, nodes, ppn, mem, hh, jobString, notif, minJobs, maxJobs, username);

out = 1;