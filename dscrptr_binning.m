function [df] = dscrptr_binning(nbh_mag,nbh_theta);
bin=zeros(8,2);
for i=1:4
    for j=1:4
        bin_no=floor(1+((7/360)*(nbh_theta(i,j)+180)));
        bin(bin_no,2)=bin_no;
        bin(bin_no,1)=bin(bin_no,1)+nbh_mag(i,j);
    end
end
%max
df=bin(:,1);
end

