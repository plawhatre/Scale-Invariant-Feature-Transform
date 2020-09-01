function mark_orientation(L,mag,theta,key)
figure()
imshow(L)
title('Orientation')
xq=key(:,2);
yq=key(:,1);
key_len=numel(key)/2;
u=[];
v=[];
for i=1:key_len
    mv=mag(key(i,1),key(i,2));
    tv=theta(key(i,1),key(i,2));
    mvv=mv*cosd(tv);
    tvv=mv*sind(tv);
    u=[u ;mvv];
    v=[v ;tvv];
end
hold on
quiver(xq,yq,u,v,'LineWidth',1,'AutoScaleFactor',2)
scatter(key(:,2),key(:,1),'r')
hold off