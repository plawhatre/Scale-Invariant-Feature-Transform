function [key] = cont_rej(D,X,key)
[ki,kj]=size(key);
tmp=[];
for i=1:ki
    D(key(i,1),key(i,2));
    vl=D(key(i,1),key(i,2));
    %threshold value
    if abs(vl)<0.03
        tmp=[tmp;i];
        X(key(i,1),key(i,2))=0;
    end
end
%removind position from keypoint matrix
key(tmp,:)=[];
end

