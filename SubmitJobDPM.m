function SubmitJobDPM(depth, parts, comp, patch)

% classes = {'cabinet', 'chair', 'table', 'window', 'door', 'bottle', 'box', 'lamp', 'pillow', 'bag', 'counter', 'bed', 'sofa', 'book', 'clothes', 'light', 'garbage bin', 'cup', 'desk', 'sink', 'faucet', 'blinds'};
classes = {'bed', 'blinds', 'chair', 'counter', 'garbage bin', 'lamp', 'pillow', 'sink', 'sofa', 'window'};

if depth
    if patch
        patches = [3 7 11 21 31];
    else
        patches = 41;
    end
else
    patches = 0;
end
if comp
    components = 2;
else
    components = 1;
end
onCluster = 1;
trunc = 1;

classesPerJob = 1; %
numJobs = ceil(length(classes)/classesPerJob)*length(patches)*length(components);

%Job Details
clear jobString;
jobString = {};
logDir = '/work4/edmundye/data/logs';
codeDir = '/home/eecs/edmundye/psiCode';
nodes = 1;
ppn = 1;
if depth
    mem = 4; %in gigs
else
    mem = 2;
end
hh = 72; %in hours
notif = false;
minJobs = numJobs;
maxJobs = numJobs;
username = 'edmundye';
if exist('patch', 'var')
    jobName = sprintf('nc%d%d%d%d', depth, parts, comp, patch);%
else
    jobName = sprintf('nc%d%d%d', depth, parts, comp);%
end

jobString = {};

for i = 1:ceil(length(classes)/classesPerJob)
    for j = 1:length(patches)
        for k = 1:length(components)
            str = 'addpath(''/home/eecs/edmundye/psiCode''); addpath(genpath(''/home/eecs/edmundye/psiCode/voc-release5''));';
            str = [str sprintf(' initConst(%d,%d,%d,%d,%d,%d); startup;', onCluster, depth, trunc, patches(j), parts, components(k))];
            str = [str pascalStr(classes((i-1)*classesPerJob+1:min([length(classes) i*classesPerJob])))];
            
            jobString{end+1} = str;
        end
    end
end

pbsRunFunctions(jobName, logDir, codeDir, nodes, ppn, mem, hh, jobString, notif, minJobs, maxJobs, username);

function p = pascalStr(classes)

p = '';

for i = 1:length(classes)
    p = [p sprintf(' pascal(''%s'');', classes{i})];
end
