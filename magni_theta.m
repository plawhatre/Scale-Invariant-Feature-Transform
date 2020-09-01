function [mag,theta] = magni_theta(L)
[m,t]=orient_asgn(L(:,:,1));
mag(:,:,1)=m;
theta(:,:,1)=t;
[m,t]=orient_asgn(L(:,:,2));
mag(:,:,2)=m;
theta(:,:,2)=t;
[m,t]=orient_asgn(L(:,:,3));
mag(:,:,3)=m;
theta(:,:,3)=t;
[m,t]=orient_asgn(L(:,:,4));
mag(:,:,4)=m;
theta(:,:,4)=t;
end

