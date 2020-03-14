
imgforTray = imread('tray.pgm');
imshow(imgforTray,[]);
axis on;
title('Original picture');
uiwait(msgbox('left click to choose the area'))
%draw the are to do the binary and get the roi location
drawing = drawfreehand();
binaryImageforTray = drawing.createMask();
subplot(2, 2, 1);
imshow(imgforTray, []);
axis on;
drawnow;
title('Original Image');
subplot(2, 2, 2);
imshow(binaryImageforTray);
axis on;
title('binary the area that I choose')
boundary = bwboundaries(binaryImageforTray);
xy = boundary{1}; 
x = xy(:, 2);
y = xy(:, 1); 
subplot(2, 2, 3);
imshow(imgforTray, []);
axis on;
hold on; 
plot(x, y, 'r-', 'LineWidth', 2);
drawnow;
title('grayscale')

%to get the roi histogram
pixelsforTray = imgforTray(binaryImageforTray);
[countsFortray,levelsForTray] = imhist(pixelsforTray);
subplot(2, 2, 4);
bar(levelsForTray, countsFortray);
title('Histogram ');
xlim([0 255]);
grid on;

%save
save('roifortray.mat')