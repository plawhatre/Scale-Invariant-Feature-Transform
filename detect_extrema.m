function [X,key_loc] = detect_extrema(D)
key_loc=[];
[m,n,o]=size(D);
X=zeros(m,n);
D=padarray(D,[1 1],'replicate');
for i=2:(m+1)
    for j=2:(n+1)
        %indices
        ru=i-1;
        rd=i+1;
        cl=j-1;
        cr=j+1;
        %neighbours
        n1=[D(ru,cl,1),D(ru,j,1),D(ru,cr,1)...
            D(i,cl,1),D(i,j,1),D(i,cr,1)...
            D(rd,cl,1),D(rd,j,1),D(rd,cr,1)];
        
        n2=[D(ru,cl,2),D(ru,j,2),D(ru,cr,2)...
            D(i,cl,2),D(i,cr,2)...
            D(rd,cl,2),D(rd,j,2),D(rd,cr,2)];
        
        n3=[D(ru,cl,3),D(ru,j,3),D(ru,cr,3)...
            D(i,cl,3),D(i,j,3),D(i,cr,3)...
            D(rd,cl,3),D(rd,j,3),D(rd,cr,3)];
        %minima
        mn1=min(n1);
        mn2=min(n2);
        mn3=min(n3);
        mn=min([mn1 mn2 mn3]);
        %maxima
        mx1=max(n1);
        mx2=max(n2);
        mx3=max(n3);
        mx=max([mx1 mx2 mx3]);
        %pixel value at present pixel
        pv=D(i,j,2);
        %local extrema condition
        if pv>mx || pv<mn
            X(i,j)=1;
            key_loc=[key_loc;i j];
        end
    end
end
end

