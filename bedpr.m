function bedpr

depth       = [0 1 1 1 1 1 1 1 1];
parts       = [0 0 1 0 0 0 0 0 0];
components  = [1 1 1 2 1 1 1 1 1];
patch       = [0 41 41 41 3 7 11 21 31];

for i = 1:9
    str = '';
    if depth(i)
        str = [str '/home/edmund/data/rgbd'];
    else
        str = [str '/home/edmund/data/rgb'];
    end
    if parts(i)
        str = [str '_parts_comp' num2str(components(i))];
    else
        str = [str '_root_comp' num2str(components(i))];
    end
    if patch(i) ~= 0
        str = [str '_patch' num2str(patch(i))];
    end
    load([str '/bed_pr_test_2012.mat']);
    styles = {'+','o','*','>','<','x','s','d','v'};
    
    newprec = [];
    newrec = [];
    
    inc = 10;
    div = 2;
    
    for j = 1:inc
        rlow = (j-1)/inc;
        rhigh = j/inc;
        idx = find((j-1)/inc<recall & recall<j/inc);
        idx = idx(1:end/div:end);
        newrec = [newrec recall(idx)];
        newprec = [newprec prec(idx)];
    end
    
    plot(newrec(1:end), newprec(1:end), ['-' styles{i}], 'MarkerSize', 8);
    hold on;
end
title('Bed Class Curves');
xlabel('recall');
ylabel('precision');
h = legend('a)','b)','c)','d)','e)','f)','g)','h)', 'i)', 'Location', 'NorthEastOutside');
v = get(h, 'title');
set(v,'string','See Tab. 1');

drawnow;