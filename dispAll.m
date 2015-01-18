function dispAll()

classes = {'bed', 'blinds', 'chair', 'counter', 'garbage bin', 'lamp', 'pillow', 'sink', 'sofa', 'window'};
load('/home/edmund/data/trainClassMapping.mat', 'myClassName');

mat = [];
%titles = {'numTrain', 'numTest'};
titles = {};
% for i = 1:length(classes)
%     num = find(ismember(myClassName, classes{i}), 1);
%     load(sprintf('/home/edmund/data/counts/cc_%d.mat', num));
%     mat = [mat; obj.numTrain obj.numTest];
% end
%mat = [mat; 0 0];
maxes = [];

% [t d] = dis(classes, 0,0,0);
% mat = [mat d];
% titles = [titles t];
% 
% [t d] = dis(classes, 0,1,0);
% mat = [mat d];
% titles = [titles t];
% 
% [t d] = dis(classes, 0,0,1);
% mat = [mat d];
% titles = [titles t];
% 
% [t d] = dis(classes, 1,0,0,0);
% mat = [mat d];
% titles = [titles t];
% 
% [t d] = dis(classes, 1,1,0,0);
% mat = [mat d];
% titles = [titles t];
% 
% [t d] = dis(classes, 1,0,1,0);
% mat = [mat d];
% titles = [titles t];
% 
% [t d] = dis(classes, 1,0,0,1);
% mat = [mat d];
% titles = [titles t];
% 
% [t d] = dis(classes, 1,1,0,1);
% mat = [mat d];
% titles = [titles t];

[t d] = dis(classes, 1,1,1,1);
mat = [mat d];
titles = [titles t];

titlesDisp = [titles 'max'];
[~, m] = max(mat.');
matDisp = [mat m.'];

dim = [0 0 1800 500];

f = figure('Position',dim);
t = uitable('Parent',f,'Data',matDisp,'ColumnName',titlesDisp,... 
            'RowName',classes,'Position', dim);
        
classes = ['remove', classes, 'avg'];

final = [titles; num2cell(mat)];
final = [classes.' final];
makeTable(final.');

function [title data] = dis(classes, depth, parts, comp, patch)
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

data = [];
title = {};

for j = 1:length(patches)
    for k = 1:length(components)
        title{end+1} = sprintf('d%dp%dc%dp%d', depth, parts, components(k), patches(j));
        addition = [];
        for i = 1:length(classes)
            folder = '/home/edmund/data/rgb';
            
            if depth
                folder = [folder 'd'];
            end
            
            if parts
                folder = [folder '_parts_'];
            else
                folder = [folder '_root_'];
            end
            
            folder = [folder 'comp' num2str(components(k))];
            
            if patches ~= 0
                folder = [folder '_patch' num2str(patches(j))];
            end
            try
                load([folder '/' classes{i} '_pr_test_2012.mat'], 'ap');
                addition = [addition; ap];
            catch
                disp(sprintf('%s%d%d%d%d', classes{i}, depth, parts, components(k), patches(j)));
                addition = [addition; 0];
            end
        end
        data = [data [addition; sum(addition)/length(addition)]];
    end
end