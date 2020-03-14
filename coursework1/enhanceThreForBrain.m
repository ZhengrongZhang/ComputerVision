
load( 'roiforEnhancementBrain.mat', '-mat');
level = graythresh(pixelsforEnhancement);
bw = imbinarize(imgEnhanceBrain, level);
subplot(131), imshow(bw), title('thresholding by graythresh');

level1 = 0.4;
bw1 = imbinarize(imgEnhanceBrain, level1);
subplot(132), imshow(bw1), title('thresholding 0.4');

level2 = 0.7;
bw2 = imbinarize(imgEnhanceBrain, level2);
subplot(133), imshow(bw2), title('thresholding 0.7');