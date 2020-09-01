function [key] = dwn_prj(k1,k2,k3)
%from 3rd to 2nd plane
kd2=2.*k3-1;
k2=[k2;kd2];
%from second to 1st plane
kd1=2.*k2-1;
key=[k1;kd1];
key=unique(key,'rows');
end

