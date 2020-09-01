function [h] = gauss_filter(k,s)
%initialization
h=zeros(k,k);
k=(k-1)/2;
x=-k:k;
y=-k:k;
for i=1:(2*k+1)
    for j=1:(2*k+1)
        %getting samples from gaussian at each row and column position (i and j)
        a=-((x(i)^2)+(y(j)^2))/(2*(s^2));
        h(i,j)=(exp(a));
    end
end
%normalization
h=h/def_sum(h(:));
end

