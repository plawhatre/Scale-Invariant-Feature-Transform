function [s] = def_sum(n)
%initialization
l=length(n);
s=0;
for i=1:l
    %cummulative addition
    s=s+n(i);
end
end

