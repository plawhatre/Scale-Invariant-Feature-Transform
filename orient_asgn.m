function [mag,theta] = orient_asgn(L)
[m,n]=size(L(:,:,1));
%initialization of magnitude and theta array
mag=zeros(m,n);
theta=zeros(m,n);
L=padarray(L,[1 1],'replicate');
m=m+2;
n=n+2;
for i=2:(m-1)
    for j=2:(n-1)
        lx2=L(i+1,j);
        lx1=L(i-1,j);
        ly2=L(i,j+1);
        ly1=L(i,j-1);
        mag(i-1,j-1)=sqrt((lx2-lx1).^2+(ly2-ly1).^2);
        t=atan2((ly2-ly1),(lx2-lx1))*(180/pi);
        theta(i-1,j-1)=t;
    end
end        
end

