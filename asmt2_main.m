clc,clear,close all
%select image
disp('Select an image from the list')
[I,I_color]=sel_img();
[df1,key1]=SIFT(I);
%final keypoints
pause(1)
mark_keypoints(I_color,key1);
title('Final Keypoints')
pause(1)
%select image
disp('Select an image from the list')
[J,J_color]=sel_img();
[df2,key2]=SIFT(J);
%final keypoints
pause(1)
mark_keypoints(J_color,key2);
title('Final Keypoints')
pause(1)
%Feature matching
[f1,f2]=match_feature(df1,df2,key1,key2);
% showMatchedFeatures
shwMatchedFeature(I_color,J_color,f1,f2)
