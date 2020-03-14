imgoringe = imread('brains.pgm');
background = wiener2(imgoringe);
I = imgoringe-background;
imgEnhanceBrain = imadjust(I);
imshow(imgEnhanceBrain,[]);
axis on;
title('Original picture');
uiwait(msgbox('left click to choose the area'))
%draw the are to do the binary and get the roi location
drawing = drawfreehand();
binaryImageEnhancement = drawing.createMask();
subplot(2, 2, 1);
imshow(imgEnhanceBrain, []);
axis on;
drawnow;
title('Original Image');
subplot(2, 2, 2);
imshow(binaryImageEnhancement);
axis on;
title('binary the area that I choose')
boundary = bwboundaries(binaryImageEnhancement);
xy = boundary{1}; 
x = xy(:, 2);
y = xy(:, 1); 
subplot(2, 2, 3);
imshow(imgEnhanceBrain, []);
axis on;
hold on; 
plot(x, y, 'r-', 'LineWidth', 2);
drawnow;
title('grayscale')

%to get the roi histogram
pixelsforEnhancement = imgEnhanceBrain(binaryImageEnhancement);
[countsforenhancementBrain,levelsforenhancementBrain] = imhist(pixelsforEnhancement);
subplot(2, 2, 4);
bar(levelsforenhancementBrain, countsforenhancementBrain);
title('Histogram ');
xlim([0 255]);
grid on;


save('roiforEnhancementBrain.mat')