function [im] = nonmax(im,theta)

if numel(theta)==1,
  theta = theta .* ones(size(im));
end


theta = mod(theta+pi/2,pi);


mask15 = ( theta>=0 & theta<pi/4 );
mask26 = ( theta>=pi/4 & theta<pi/2 );
mask37 = ( theta>=pi/2 & theta<pi*3/4 );
mask48 = ( theta>=pi*3/4 & theta<pi );

mask = ones(size(im));
[h,w] = size(im);
[ix,iy] = meshgrid(1:w,1:h);

% case 1
idx = find( mask15 & ix<w & iy<h);
idxA = idx + h;
idxB = idx + h + 1;
d = tan(theta(idx));
imI = im(idxA).*(1-d) + im(idxB).*d;
mask(idx(find(im(idx)<imI))) = 0;

% case 5
idx = find( mask15 & ix>1 & iy>1);
idxA = idx - h;
idxB = idx - h - 1;
d = tan(theta(idx));
imI = im(idxA).*(1-d) + im(idxB).*d;
mask(idx(find(im(idx)<imI))) = 0;

% case 2
idx = find( mask26 & ix<w & iy<h );
idxA = idx + 1;
idxB = idx + h + 1;
d = tan(pi/2-theta(idx));
imI = im(idxA).*(1-d) + im(idxB).*d;
mask(idx(find(im(idx)<imI))) = 0;

% case 6
idx = find( mask26 & ix>1 & iy>1 );
idxA = idx - 1;
idxB = idx - h - 1;
d = tan(pi/2-theta(idx));
imI = im(idxA).*(1-d) + im(idxB).*d;
mask(idx(find(im(idx)<imI))) = 0;

% case 3
idx = find( mask37 & ix>1 & iy<h );
idxA = idx + 1;
idxB = idx - h + 1;
d = tan(theta(idx)-pi/2);
imI = im(idxA).*(1-d) + im(idxB).*d;
mask(idx(find(im(idx)<imI))) = 0;

% case 7
idx = find( mask37 & ix<w & iy>1 );
idxA = idx - 1;
idxB = idx + h - 1;
d = tan(theta(idx)-pi/2);
imI = im(idxA).*(1-d) + im(idxB).*d;
mask(idx(find(im(idx)<imI))) = 0;

% case 4
idx = find( mask48 & ix>1 & iy<h );
idxA = idx - h;
idxB = idx - h + 1;
d = tan(pi-theta(idx));
imI = im(idxA).*(1-d) + im(idxB).*d;
mask(idx(find(im(idx)<imI))) = 0;

% case 8
idx = find( mask48 & ix<w & iy>1 );
idxA = idx + h;
idxB = idx + h - 1;
d = tan(pi-theta(idx));
imI = im(idxA).*(1-d) + im(idxB).*d;
mask(idx(find(im(idx)<imI))) = 0;

% apply mask
im = im .* mask;
im=mask;



