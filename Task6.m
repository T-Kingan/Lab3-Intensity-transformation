clear all;
close all;

% Read the input image
directory = 'C:/Users/thoma/OneDrive - Imperial College London/Des Eng Y4/DesignVisualSystems/Lab 3/Lab3-Intensity-transformation/assets';
rel_path = 'moon.tif';
full_path = fullfile(directory, rel_path);

originalImage = imread(full_path); % Corrected to imread for reading the image

% Display the original image
figure; % Open a new figure
imshow(originalImage); % Display the image
title('Original Image'); % Title for the original image

% Get user input for filter type
filterTypes = {'average', 'disk', 'gaussian', 'laplacian', 'log', 'motion', 'prewitt', 'sobel'};
filterType = input('Choose a filter type: (average/disk/gaussian/laplacian/log/motion/prewitt/sobel) ', 's');

% Get user input for filter size
filterSize = input('Enter the filter size: ');

% Create the filter using fspecial
filter = fspecial(filterType, filterSize);

% Apply the filter to the original image
filteredImage = imfilter(originalImage, filter, 'replicate');

% Display the filtered image
figure; % Open a new figure for the montage
montage({originalImage, filteredImage}); % Corrected to display both images
title(['Unfiltered (left) & Filtered (right) - ' filterType ' Filter, Size ' num2str(filterSize)]);
