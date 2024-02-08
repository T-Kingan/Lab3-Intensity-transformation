clear all; % Clears all variables from the workspace
imfinfo('C:\Users\thoma\OneDrive - Imperial College London\Des Eng Y4\DesignVisualSystems\Lab 3\Lab3-Intensity-transformation\assets\breastXray.tif');
f = imread('C:\Users\thoma\OneDrive - Imperial College London\Des Eng Y4\DesignVisualSystems\Lab 3\Lab3-Intensity-transformation\assets\breastXray.tif');
imshow(f); % Display the image

% Print the intensity of pixel(3,10)
% Assuming 'f' is a grayscale image. If 'f' is a color image, this might need adjustment.
fprintf('Intensity of pixel(3,10): %d\n', f(3,10));

% Display only top half of the image
% Assuming 'f' is a grayscale image. For color images, use f(1:241, :, :)
halfHeight = size(f,1) / 2; % Dynamically calculate half of the image height
imshow(f(1:halfHeight, :)); % Display the top half of the image

halfwidth = size(f,2) / 2; %
imshow(f(:,halfwidth:size(f,2)));

% Find max and min intensity values of the image
fmin = min(f(:));
fmax = max(f(:));
fprintf('Minimum intensity: %d\nMaximum intensity: %d\n', fmin, fmax);

%{
% Negative Image
g1 = imadjust(f, [0 1], [0.25 0.75]);
g2 = imadjust(f, [0.1 0.9], [1 0]);
figure;

subplot(1, 3, 1); % Divide the figure into a 1x3 grid, and access the first element
imshow(f); % Display the original image
title('Original Image');

subplot(1, 3, 2); % Access the second element of the grid
imshow(g1); % Display the first processed image
title('Processed Image g1');

subplot(1, 3, 3); % Access the third element of the grid
imshow(g2); % Display the second processed image
title('Processed Image g2');
%}

g2 = imadjust(f, [0.5 0.75], [0 1]);
g3 = imadjust(f, [ ], [ ], 2);
figure
montage({g2,g3})

