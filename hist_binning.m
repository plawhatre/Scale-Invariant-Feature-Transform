function [theta] = hist_binning(nbh_mag,nbh_theta,h);
bin=zeros(36,2);
for i=1:5
    for j=1:5
        bin_no=floor(1+((35/360)*(nbh_theta(i,j)+180)));
        bin(bin_no,2)=bin_no;
        bin(bin_no,1)=bin(bin_no,1)+h(i,j).*nbh_mag(i,j);
    end
end
%max
mx=max(bin(:,1));
theta=bin(bin(:,1)==mx,2);
theta=(theta+0.5)*10;
end

