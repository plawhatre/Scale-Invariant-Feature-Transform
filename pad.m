function [J] = pad(I,k)
[m,n]=size(I);
J=zeros(m+2*k,n+2*k);
J(((k+1):(m+k)),((k+1):(n+k)))=I;
end

