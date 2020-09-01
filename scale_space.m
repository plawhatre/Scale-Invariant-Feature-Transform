function [D,L] = scale_space(I,a,sigma)
[ix,iy]=size(I);
L=zeros(ix,iy,4);
%Gaussian space
%1
wd_sz=13;
h=gauss_filter(wd_sz,sigma);
L(:,:,1)=img_conv(I,h,ix,iy,wd_sz);
%2
h=gauss_filter(wd_sz,sigma);
L(:,:,2)=img_conv(I,h,ix,iy,wd_sz);
%3
h=gauss_filter(wd_sz,a*sigma);
L(:,:,3)=img_conv(I,h,ix,iy,wd_sz);
%4
h=gauss_filter(wd_sz,(a^2)*sigma);
L(:,:,4)=img_conv(I,h,ix,iy,wd_sz);

%DOG space
D=zeros(ix,iy,3);
%
D(:,:,1)=L(:,:,2)-L(:,:,1);
D(:,:,2)=L(:,:,3)-L(:,:,2);
D(:,:,3)=L(:,:,4)-L(:,:,3);
end




