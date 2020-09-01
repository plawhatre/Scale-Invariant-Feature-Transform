function [vect,key] = SIFT(I)
%parameters
a=sqrt(2);
sigma=1/sqrt(2);
%%Q1-a:SCALE SPACE DECOMPOSITION(STEP 1)
tic
%first octave
[D1,L1]=scale_space(I,a,sigma);
%second octave
sigmad=sigma*2;
Ip=img_pyramid(I);
[D2,L2]=scale_space(Ip,a,sigmad);
%third octave
sigmadd=sigmad*2;
Ip=img_pyramid(Ip);
[D3,L3]=scale_space(Ip,a,sigmadd);
disp('Sucessful execution of step 1')
toc
%%Q1-b:EXTREMA DETECTION(STEP 2)
tic
[X1,key1]=detect_extrema(D1);
[X2,key2]=detect_extrema(D2);
[X3,key3]=detect_extrema(D3);
disp('Sucessful execution of step 2')
toc
%%OUTLIER REJECTION(STEP 3)
tic
%low contrast rejection
key1=cont_rej(D1(:,:,2),X1,key1);
key2=cont_rej(D2(:,:,2),X2,key2);
key3=cont_rej(D3(:,:,2),X3,key3);
%spurious edge rejection
key1=sEdge_rej(D1(:,:,2),key1);
key2=sEdge_rej(D2(:,:,2),key2);
key3=sEdge_rej(D3(:,:,2),key3);
disp('Sucessful execution of step 3')
toc
% %highlight keypoint
mark_keypoints(L1(:,:,2),key1)
title('Keypoints')
pause(1)
mark_keypoints(L2(:,:,2),key2)
title('Keypoints')
pause(1)
mark_keypoints(L3(:,:,2),key3)
title('Keypoints')
%%Q1-c:ORIENTATION ASSIGNMENT(STEP 4)
tic
%first octave
[mag1,theta1]=magni_theta(L1);
%second octave
[mag2,theta2]=magni_theta(L2);
%third octave
[mag3,theta3]=magni_theta(L3);
%orientation histogram
%first octave
theta1=orient_hist(L1,key1,mag1,theta1,a,sigma);
%second octave
theta2=orient_hist(L2,key2,mag2,theta2,a,sigmad);
%third octave
theta3=orient_hist(L3,key3,mag3,theta3,a,sigmadd);
disp('Sucessful execution of step 4')
toc
%highlight orientation
pause(1)
mark_orientation(L1(:,:,2),mag1(:,:,2),theta1(:,:,2),key1)
pause(1)
mark_orientation(L2(:,:,2),mag2(:,:,2),theta2(:,:,2),key2)
pause(1)
mark_orientation(L3(:,:,2),mag3(:,:,2),theta3(:,:,2),key3)
%%Q1-d:KEYPOINT DESCRIPTOR(STEP 5)
tic
%down projection
key=dwn_prj(key1,key2,key3);
L=L1(:,:,2);
%magnitude angle calculation
[mi,ti]=mi_ti(L);
%binning
L=padarray(L,[8 8],'replicate');
mi=padarray(mi,[8 8],'replicate');
ti=padarray(ti,[8 8],'replicate');
k_len=length(key(:,1));
h=gauss_filter(16,8);
vect=zeros(128,k_len);
for k=1:k_len
    i=key(k,1);
    j=key(k,2);
    nbh_m=mi((i):(i+15),(j):(j+15));
    cnv_m=(nbh_m).*h;
    nbh_t=ti((i):(i+15),(j):(j+15));
    cnv_t=(nbh_t);
    tmp=[];
    for ki=1:4
        for kj=1:4
            blk_m=cnv_m((4*ki-3):(4*ki),(4*kj-3):(4*kj));
            blk_t=cnv_t((4*ki-3):(4*ki),(4*kj-3):(4*kj));
            tmpe=dscrptr_binning(blk_m,blk_t);
            tmp=[tmp ;tmpe];
        end
    end
    vect(:,k)=tmp;
end
disp('Sucessful execution of step 5')
toc
end

