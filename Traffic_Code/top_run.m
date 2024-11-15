clc
clear all
close all
%%  reference image

[filename ,filepath]=uigetfile('*.*','Select reference image');
filedir=strcat(filepath,'\',filename);
img=imread(filedir);
resize=256; % resize image
img_ref=imresize(img,[resize resize],'bilinear');

figure,subplot(2,2,1),imshow(img_ref);
title('Reference Image');


%%  capture image

[filename ,filepath]=uigetfile('*.*','Select capture image');
filedir=strcat(filepath,'\',filename);
img=imread(filedir);
resize=256; % resize image
img_cap=imresize(img,[resize resize],'bilinear');

subplot(2,2,2),imshow(img_cap);
title('Capture Image');


%%  rgb to gray conversion  for reference image

if(ndims(img_ref)==3)
    img_ref1=rgb_to_gray_process(img_ref);
else
    img_ref1=img_ref;
end

subplot(2,2,3),imshow(img_ref1);
title('Gray Reference Image');


%%  rgb to gray conversion  for capture image

if(ndims(img_cap)==3)
    img_cap1=rgb_to_gray_process(img_cap);
else
    img_cap1=img_cap;
end
subplot(2,2,4),imshow(img_cap1);
title('Gray Capture Image');


%% image enchancement for reference image 
img_enc_ref=image_enchance_process(img_ref1);
figure,
subplot(2,2,1),imshow(img_enc_ref);
title('Enchancement Reference Image');
%% image enchancement for capture image 
img_enc_cap=image_enchance_process(img_cap1);

subplot(2,2,2),imshow(img_enc_cap);
title('Enchancement Capture Image');

%% edge for reference image 

disp('1=Canny,2=Sobel,3=Prewitt,4=Roberts,5=Gabour');
sel=input('Select the Type of Edge Detection');

img_edge_ref=image_edge_process(img_enc_ref,sel);
subplot(2,2,3),imshow(img_edge_ref);
title('Edge for Reference Image');


%% edge for capture image 
img_edge_cap=image_edge_process(img_enc_cap,sel);
subplot(2,2,4),imshow(img_edge_cap);
title('Edge for Capture Image');

%% edge based match process

matched_percentage=edge_based_match_process(img_edge_ref,img_edge_cap);

if(matched_percentage>=0 && matched_percentage<=10)
    
    result='Green Light is on for 90 seconds';
    clrval=[0 1 0];
elseif(matched_percentage>10 && matched_percentage<=50)
     result='Green Light is on for 60 seconds';
     clrval=[0 1 0];
elseif(matched_percentage>50 && matched_percentage<=70)
     result='Green Light is on for 30 seconds';
     clrval=[0 1 0];
 elseif(matched_percentage>70 && matched_percentage<=90)
     result='Green Light is on for 20 seconds';
     clrval=[0 1 0];
 elseif(matched_percentage>90 && matched_percentage<=100)
     result='Red Light is on for 60 seconds';
     clrval=[1 0 0];
end

     
diffimg=abs(img_edge_ref-img_edge_cap);
locr=find(diffimg);

tmpimg=zeros(resize,resize);
tmpimg(locr)=img_cap1(locr);
figure,subplot(2,1,1),imshow(uint8(tmpimg))
subplot(2,1,2),plot(0,0); axis off;
hold on;
text(0,0,result,'HorizontalAlignment','right','fontsize',10,'color',clrval)




































