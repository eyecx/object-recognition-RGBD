function SubmitJobWriteAnnotations()

c = const(1, 1);

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
minJobs = 97;
maxJobs = 97;
username = 'edmundye';
jobName = 'ann';

jobString = cell(97);

for i = 1:97
    jobString{i} = sprintf('writeAnnotations(%d, %d, %d)', i, 1, 1);
end

pbsRunFunctions(jobName, logDir, codeDir, nodes, ppn, mem, hh, jobString, notif, minJobs, maxJobs, username);