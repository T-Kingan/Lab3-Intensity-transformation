directory = 'C:/Users/thoma/OneDrive - Imperial College London/Des Eng Y4/DesignVisualSystems/Lab 3/Lab3-Intensity-transformation/assets';
rel_path = 'pollen.tif'
full_path = fullfile(directory, rel_path);
f = imread(full_path);
imshow(f);
figure;
imhist(f);
[fmin, fmax] = bounds(f(:))

close all
g=imadjust(f,[0.3 0.55]);
montage({f, g});     % display list of images side-by
figure;
imhist(g);

g_pdf = imhist(g) ./ numel(g);
g_cdf = cumsum(g_pdf);

close all
imshow(g);
subplot(1,2,1)
plot(g_pdf)
subplot(1,2,2)
plot(g_cdf)

x = linspace(0, 1, 256);    % x has 256 values equally spaced
                            %  .... between 0 and 1
figure
plot(x, g_cdf)
axis([0 1 0 1])             % graph x and y range is 0 to 1
set(gca, 'xtick', 0:0.2:1)  % x tick marks are in steps of 0.2
set(gca, 'ytick', 0:0.2:1)
xlabel('Input intensity values', 'fontsize', 9)
ylabel('Output intensity values', 'fontsize', 9)
title('Transformation function', 'fontsize', 12)

h = histeq(g,256);              % histogram equalize g
close all
montage({f, g, h})
figure;
subplot(1,3,1); imhist(f);
subplot(1,3,2); imhist(g);
subplot(1,3,3); imhist(h);

