function img_edge=image_edge_process(img,sel)


if(sel==1)
img_edge=edge(img,'canny');
end

if(sel==2)
img_edge=edge(img,'sobel');
end


if(sel==3)
img_edge=edge(img,'prewitt');
end
    
 
if(sel==4)
img_edge=edge(img,'roberts');
end 

if(sel==5)
% gabor filter based edge detection 

[rr,cc]=size(img);

wavelength = 4;
orientation = 90/2;
[mag,phase] = imgaborfilt(img,wavelength,orientation);
img_edge=nonmax(double(img),phase);
end 
