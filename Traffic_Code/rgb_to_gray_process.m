function resimg=rgb_to_gray_process(img)


Rimg=img(:,:,1);
Gimg=img(:,:,2);
Bimg=img(:,:,3);

resimg=0.2989 * Rimg + 0.5870 * Gimg + 0.1140 * Bimg;

