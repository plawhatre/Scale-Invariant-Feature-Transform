function shwMatchedFeature(I_color,J_color,f1,f2)
figure; ax = axes;
set(gca,'XAxisLocation','top','YAxisLocation','left','ydir','reverse');
[st1,ed1]=size(f1);
[st2,ed2]=size(f2);
r1=f1(floor(linspace(1,st1,20)),:);
r2=f2(floor(linspace(1,st2,20)),:);
% showMatchedFeatures(permute(I_color,[2 1 3]),permute(J_color,[2 1 3]),f1,f2,'Montage','Parent',ax)
title('imageMatching')
showMatchedFeatures(permute(I_color,[2 1 3]),permute(J_color,[2 1 3]),r1,r2,'Montage','Parent',ax)
view(270,270)
