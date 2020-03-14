
img = imread('brains.pgm');
imshow(img,[]);
axis on;
title('Original picture');
uiwait(msgbox('left click to choose the area'))
%draw the are to do the binary and get the roi location
drawing = drawfreehand();
binaryImage = drawing.createMask();
subplot(2, 2, 1);
imshow(img, []);
axis on;
drawnow;
title('Original Image');
subplot(2, 2, 2);
imshow(binaryImage);
axis on;
title('binary the area that I choose')
boundary = bwboundaries(binaryImage);
xy = boundary{1}; 
x = xy(:, 2);
y = xy(:, 1); 
subplot(2, 2, 3);
imshow(img, []);
axis on;
hold on; 
plot(x, y, 'r-', 'LineWidth', 2);
drawnow;
title('grayscale')

%to get the roi histogram
pixels = img(binaryImage);
[counts,levels] = imhist(pixels);
subplot(2, 2, 4);
bar(levels, counts);
title('Histogram ');
xlim([0 255]);
grid on;

%save
save('roiforBrain.mat')