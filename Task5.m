% Load the image
directory = 'C:/Users/thoma/OneDrive - Imperial College London/Des Eng Y4/DesignVisualSystems/Lab 3/Lab3-Intensity-transformation/assets';
rel_path = 'moon.tif';
full_path = fullfile(directory, rel_path);
f = imread(full_path);

% Define the filter size
filter_size = [10 10];

% Display original image
figure;
subplot(2,2,1);
imshow(f);
title('Original Image');

% Apply median filtering with 'zeros' padding
g_median_zeros = medfilt2(f, filter_size, 'zeros');

% Apply median filtering with 'symmetric' padding
g_median_symmetric = medfilt2(f, filter_size, 'symmetric');

% Apply median filtering with 'indexed' padding
% MATLAB will pad with 1s if f is of class double, with 0s otherwise
g_median_indexed = medfilt2(f, filter_size, 'indexed');

% Display 'zeros' padding result
subplot(2,2,2);
imshow(g_median_zeros);
title('Median Filter (Zeros)');

% Display 'symmetric' padding result
subplot(2,2,3);
imshow(g_median_symmetric);
title('Median Filter (Symmetric)');

% Display 'indexed' padding result
subplot(2,2,4);
imshow(g_median_indexed);
title('Median Filter (Indexed)');
