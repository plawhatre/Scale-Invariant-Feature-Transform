function [R] = img_conv(I,h,ix,iy,k)
%padding the image with zeros 
I=pad(I,k);
R=zeros(ix,iy);
ks=(k-1)/2;
for i=(k+1):(k+ix)
    for j=(k+1):(k+iy)
        %region in image where masked is placed
        n=I(((i-ks):(i+ks)),((j-ks):(j+ks)));
        %multiplying mask and adding and storing the value at central pixel
        sr=n.*h;
        R(i-k,j-k)=def_sum(sr(:));
    end
end
end

