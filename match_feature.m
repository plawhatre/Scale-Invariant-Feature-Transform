function [f1,f2] = match_feature(df1,df2,key1,key2);
[~,n1]=size(df1);
[~,n2]=size(df2);
%distance matrices
for i=1:n1
    for j=1:n2
        del_x=df1(:,i)-df2(:,j);
        del_x2=del_x.*del_x;
        del=def_sum(del_x2(:));
        dist(i,j)=sqrt(del);
    end
end
dist2=sort(dist')';
%minimum
m1=dist2(:,1);
m2=dist2(:,2);
r=m1./m2;
b=(r<0.6);
len=length(b);
mch=[];
f1=[];
f2=[];
%matching with coordinates
for k=1:len
    if b(k)==1
        tmp=dist(k,:);
        sz=length(tmp);
        for l=1:sz
            if tmp(l)==m1(k)
                break
            end
        end
        mch=[mch;k l];

    end
end
%extraction
f1=key1(mch(:,1),:);
f2=key2(mch(:,2),:);
end