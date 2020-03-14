
load( 'roifortray.mat', '-mat');
level = graythresh(pixelsforTray);
bw = imbinarize(imgforTray, level);
subplot(131), imshow(bw), title('thresholding by graythresh');

level1 = 0.4;
bw1 = imbinarize(imgforTray, level1);
subplot(132), imshow(bw1), title('thresholding 0.4');

level2 = 0.7;
bw2 = imbinarize(imgforTray, level2);
subplot(133), imshow(bw2), title('thresholding 0.7');