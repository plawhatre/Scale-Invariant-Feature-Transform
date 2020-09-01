function [J] = img_pyramid(I)
[m,n]=size(I);
%even dimensions required
c1=mod(m,2);
c2=mod(n,2);
if c1==1 & c2~=1
    I(m+1,:)=I(m,:);
end
if c2==1 & c1~=1
    I(:,n+1)=I(:,n);
end
if c1==1 & c2==1
%     I(:,end+1)=I(:,end);
    I(m+1,:)=I(m,:);
    I(:,n+1)=I(:,n);
end
%averaging by 2*2 window
[m,n]=size(I);
J=zeros(m/2,n/2);
jr=0;
jc=0;
for ir=1:2:m
    jr=jr+1;
    for ic=1:2:n
        jc=jc+1;
        J(jr,jc)=(I(ir,ic)+I(ir,ic+1)+I(ir+1,ic)+I(ir+1,ic+1))/4;
    end
    jc=0;
end     
end

