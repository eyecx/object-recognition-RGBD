function ind = VOChash_lookup(hash,s)

hsize=numel(hash.key);
h=mod(str2double(s([1:end])),hsize)+1;
ind=hash.val{h}(strmatch(s,hash.key{h},'exact'));
