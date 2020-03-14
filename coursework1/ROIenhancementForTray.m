imgoringe2 = imread('tray.pgm');
background2 = wiener2(imgoringe2);
I2 = imgoringe2-background2;
imgEnhanceTray = imadjust(I2);
imshow(imgEnhanceTray,[]);
axis on;
title('Original picture');
uiwait(msgbox('left click to choose the area'))
%draw the are to do the binary and get the roi location
drawing = drawfreehand();
binaryImageforEnhanceTray = drawing.createMask();
subplot(2, 2, 1);
imshow(imgEnhanceTray, []);
axis on;
drawnow;
title('Original Image');
subplot(2, 2, 2);
imshow(binaryImageforEnhanceTray);
axis on;
title('binary the area that I choose')
boundary = bwboundaries(binaryImageforEnhanceTray);
xy = boundary{1}; 
x = xy(:, 2);
y = xy(:, 1); 
subplot(2, 2, 3);
imshow(imgEnhanceTray, []);
axis on;
hold on; 
plot(x, y, 'r-', 'LineWidth', 2);
drawnow;
title('grayscale')

%to get the roi histogram
pixelsforEnTray = imgEnhanceTray(binaryImageforEnhanceTray);
[countsForEntray,levelsForEnTray] = imhist(pixelsforEnTray);
subplot(2, 2, 4);
bar(levelsForEnTray, countsForEntray);
title('Histogram ');
xlim([0 255]);
grid on;

save('roiforEntray.mat')