
load( 'roiforBrain.mat', '-mat');
level = graythresh(pixels);
bw = imbinarize(img, level);
subplot(131), imshow(bw), title('thresholding by graythresh');

level1 = 0.4;
bw1 = imbinarize(img, level1);
subplot(132), imshow(bw1), title('thresholding 0.4');

level2 = 0.7;
bw2 = imbinarize(img, level2);
subplot(133), imshow(bw2), title('thresholding 0.7');