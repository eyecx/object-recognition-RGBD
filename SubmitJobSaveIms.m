function SubmitJobSaveIms()

c1 = const(1, 1);

%Job Details
clear jobString;
jobString = {};
logDir = c1.logs;
codeDir = c1.code;
nodes = 1;
ppn = 1;
mem = 4; %in gigs
hh = 72; %in hours
notif = false;
minJobs = 2;
maxJobs = 2;
username = 'edmundye';
jobName = 'save';

jobString = cell(2);

jobString{1} = 'saveIms(1,1)';
jobString{2} = 'saveIms(1,0)';

pbsRunFunctions(jobName, logDir, codeDir, nodes, ppn, mem, hh, jobString, notif, minJobs, maxJobs, username);