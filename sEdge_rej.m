function [key1] = sEdge_rej(D,key);
%sobel filter
hx=(1/8)*[-1 -2 -1;0 0 0;1 2 1];
hy=hx';
%Dx Dy
[m n]=size(D);
Dx=img_conv(D,hx,m,n,3);
Dy=img_conv(D,hy,m,n,3);
%Dxx Dyy
Dxx=img_conv(Dx,hx,m,n,3);
Dyy=img_conv(Dy,hy,m,n,3);
%Dxy Dyx
Dxy=img_conv(Dx,hy,m,n,3);
Dyx=img_conv(Dy,hx,m,n,3);
%trace and determinant
tr=Dxx+Dyy;
det=(Dxx).*(Dyy-(Dyx./Dxx).*(Dxy));
%ratio
ratio=(tr.^2)./(det+realmin);
[kx,ky]=size(key);
key1=[];
for i=1:kx
    if ratio(key(i,1),key(i,2))<12.1
        key1=[key1;key(i,1) key(i,2)];
    end
end
end