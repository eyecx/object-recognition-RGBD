function str = listClassesString(myClassName, objList)

str = '{';
for i=1:length(objList)
    str = strcat(str, ' "PAS', myClassName{objList(i)}, '"');
end
str = sprintf('%s }', str);