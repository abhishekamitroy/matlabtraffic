function outimg=image_enc_filter(dim)


cim=double(dim);
[r,c]=size(cim);
r1=2*r;
c1=2*c;
pim=zeros((r1),(c1));
kim=zeros((r1),(c1));
%padding
for i=1:r
    for j=1:c
   pim(i,j)=cim(i,j);
    end
end
%center the transform
for i=1:r
    for j=1:c
   kim(i,j)=pim(i,j)*((-1)^(i+j));
    end
end
%2D fft
fim=fft2(kim);
n=1; %order for butterworth filter
thresh=10; % cutoff radius in frequency domain for filters
him=highboost_butter_filter(fim,thresh,n);  % using butterworth high pass filter
%inverse 2D fft
ifim=ifft2(him);
 
for i=1:r1
    for j=1:c1
   ifim(i,j)=ifim(i,j)*((-1)^(i+j));
    end
end


% removing the padding
for i=1:r
    for j=1:c
   rim(i,j)=ifim(i,j);
    end
end
rim=real(rim);
outimg=uint8(rim);








