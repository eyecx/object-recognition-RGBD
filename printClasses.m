function printClasses()

c = const(0);

load(fullfile(c.data, 'nyu_depth_v2_labeled.mat'), 'names');
load(fullfile(c.data, 'myClassMapping_37'), 'myClassName');

originalClasses = fopen(fullfile('/home', 'edmund', 'Desktop', '894class.txt'), 'w');
newClasses = fopen(fullfile('/home', 'edmund', 'Desktop', '40class.txt'), 'w');

for i = 1:length(names)
    fprintf(originalClasses, '%s\n', names{i});
end

for i = 1:length(myClassName)
    fprintf(newClasses, '%s\n', myClassName{i});
end

fclose(originalClasses);
fclose(newClasses);