function mark_keypoints(I,key)
figure()
imshow(I)
hold on 
scatter(key(:,2),key(:,1),'r')
hold off