function [I,I_color] = sel_img()
warning off
addpath('input_images')
%Image selection
list = {'a_1','a_2','b_1','b_2','c_1','c_2','d_1','d_2','e_1','e_2'};
[indx] = listdlg('ListString',list,'SelectionMode','single');
if indx==1
    %reading image
    I=imread('a_1.jpg');
    I_color=I;
    I=im2double(rgb2gray(I));
    %resize image 
    [m,n]=size(I);
    hor=800;
    n=floor(hor*n/m); 
    I=imresize(I,[hor n]);
    I_color=imresize(I_color,size(I));
end
if indx==2
    %reading image
    I=imread('a_2.jpg');
    I_color=I;
    I=im2double(rgb2gray(I));
    %resize image 
    [m,n]=size(I);
    hor=800;
    n=floor(hor*n/m); 
    I=imresize(I,[hor n]);
    I_color=imresize(I_color,size(I));
end
if indx==3
    %reading image
    I=imread('b_1.jpg');
    I_color=I;
    I=im2double(rgb2gray(I));
    %resize image 
    [m,n]=size(I);
    hor=800;
    n=floor(hor*n/m); 
    I=imresize(I,[hor n]);
    I_color=imresize(I_color,size(I));
end
if indx==4
    %reading image
    I=imread('b_2.jpg');
    I_color=I;
    I=im2double(rgb2gray(I));
    %resize image 
    [m,n]=size(I);
    hor=800;
    n=floor(hor*n/m); 
    I=imresize(I,[hor n]);
    I_color=imresize(I_color,size(I));
end
if indx==5
    %reading image
    I=imread('c_1.jpg');
    I_color=I;
    I=im2double(rgb2gray(I));
    %resize image 
    [m,n]=size(I);
    hor=800;
    n=floor(hor*n/m); 
    I=imresize(I,[hor n]);
    I_color=imresize(I_color,size(I));
end
if indx==6
    %reading image
    I=imread('c_2.jpg');
    I_color=I;
    I=im2double(rgb2gray(I));
    %resize image 
    [m,n]=size(I);
    hor=800;
    n=floor(hor*n/m); 
    I=imresize(I,[hor n]);
    I_color=imresize(I_color,size(I));
end
if indx==7
    %reading image
    I=imread('d_1.jpg');
    I_color=I;
    I=im2double(rgb2gray(I));
    %resize image 
    [m,n]=size(I);
    hor=800;
    n=floor(hor*n/m); 
    I=imresize(I,[hor n]);
    I_color=imresize(I_color,size(I));
end
if indx==8
    %reading image
    I=imread('d_2.jpg');
    I_color=I;
    I=im2double(rgb2gray(I));
    %resize image 
    [m,n]=size(I);
    hor=800;
    n=floor(hor*n/m); 
    I=imresize(I,[hor n]);
    I_color=imresize(I_color,size(I));
end
if indx==9
    %reading image
    I=imread('e_1.png');
    I_color=I;
    I=im2double(rgb2gray(I));
    %resize image 
    [m,n]=size(I);
    hor=800;
    n=floor(hor*n/m); 
    I=imresize(I,[hor n]);
    I_color=imresize(I_color,size(I));
end
if indx==10
    %reading image
    I=imread('e_2.png');
    I_color=I;
    I=im2double(rgb2gray(I));
    %resize image 
    [m,n]=size(I);
    hor=800;
    n=floor(hor*n/m); 
    I=imresize(I,[hor n]);
    I_color=imresize(I_color,size(I));
end
end

