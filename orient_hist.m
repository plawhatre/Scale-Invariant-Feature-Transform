function [theta] = orient_hist(L,key,mag,theta,a,sigma)
[m,n,o]=size(L);
k_len=length(key(:,1));
%padding magnitude and angle array
mag=padarray(mag,[2 2],'replicate');
theta=padarray(theta,[2 2],'replicate');
for k=1:o
    Ltemp=L(:,:,k);
    %sigma for gaussian
    if k==1
        sig=sigma;
    elseif k==2
        sig=a*sigma;
    elseif k==3
        sig=(a^2)*sigma;
    else
        sig=(a^3)*sigma;
    end
    %filtering
    h=gauss_filter(5,sig);
    for i=1:k_len
        rr=key(i,1);
        cc=key(i,2);
        nbh_mag=mag((rr:rr+4),(cc:cc+4),k);
        nbh_theta=theta((rr:rr+4),(cc:cc+4),k);
        theta(rr,cc,k)=hist_binning(nbh_mag,nbh_theta,h);
    end
end
end

