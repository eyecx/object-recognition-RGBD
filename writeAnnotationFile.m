function writeAnnotationFile(c, j, imageSize, myClassName, objList, bboxes)

ann = fopen(fullfile(c.base, 'VOCdevkit', 'VOC2012', 'Annotations', sprintf('%04d.txt', j)), 'w');

if isempty(objList)
    fprintf(ann, sprintf('Image filename : "%s"', fullfile('VOC2012', 'Images', sprintf('%04d.jpg', j))));
else
    numObj = length(objList);
    fprintf(ann, '# PASCAL Annotation Version 1.00\n\n');
    
    fprintf(ann, sprintf('Image filename : "%s"\n', fullfile('VOC2012', 'Images', sprintf('%04d.jpg', j))));
    
    fprintf(ann, sprintf('Image size (X x Y x C) : %d x %d x %d\n', imageSize(2), imageSize(1), imageSize(3)));
    
    fprintf(ann, 'Database : "NYU Depth"\n');
    
    fprintf(ann, sprintf('Objects with ground truth : %d %s\n\n', numObj, listClassesString(myClassName, objList)));
    
    fprintf(ann, '# Note that there might be other objects in the image\n# for which ground truth data has not been provided.\n\n# Top left pixel co-ordinates : (0, 0)\n\n');
    
    for k = 1:numObj
        cls = myClassName{objList(k)};
        
        fprintf(ann, '# Details for object %d ("PAS%s")\n# Center point -- not available in other PASCAL databases -- refers\n# to person head center\n', k, cls);
        
        fprintf(ann, 'Original label for object %d "PAS%s" : "PAS%s"\n', k, cls, cls);
        
        fprintf(ann, 'Bounding box for object %d "PAS%s" (Xmin, Ymin) - (Xmax, Ymax) : (%d, %d) - (%d, %d)\n\n', k, cls,bboxes(k, 1), bboxes(k, 2), bboxes(k, 3), bboxes(k, 4));
    end
end

fclose(ann);