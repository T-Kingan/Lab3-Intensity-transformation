clear all       % clear all variables
close all       % close all figure windows
path = 'C:/Users/thoma/OneDrive - Imperial College London/Des Eng Y4/DesignVisualSystems/Lab 3/Lab3-Intensity-transformation/assets/bonescan-front.tif';
f = imread(path);
r = double(f);  % uint8 to double conversion
k = mean2(r);   % find mean intensity of image
E = 0.9;
s = 1 ./ (1.0 + (k ./ (r + eps)) .^ E);
g = uint8(255*s);
imshowpair(f, g, "montage")



