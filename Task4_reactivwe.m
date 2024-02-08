function reactiveFilterGUI
    % Prepare the workspace
    close all; % Close all figures
    clear; % Clear variables

    % Load the image
    directory = 'C:/Users/thoma/OneDrive - Imperial College London/Des Eng Y4/DesignVisualSystems/Lab 3/Lab3-Intensity-transformation/assets';
    rel_path = 'noisyPCB.jpg';
    full_path = fullfile(directory, rel_path);
    f = imread(full_path);

    % Create a figure for the GUI
    fig = figure('Name', 'Interactive Filter Adjuster', 'NumberTitle', 'off', 'Position', [100, 100, 1200, 600]);

    % Display the original image
    subplot(1, 3, 1);
    imshow(f);
    title('Original Image');

    % Initialize filters with default values
    updateFilters(3, 3, 1.0); % Initial filter sizes and sigma for Gaussian

    % Box filter size slider and label
    uicontrol('Style', 'text', 'Position', [20 580 120 20], 'String', 'Box Filter Size');
    uicontrol('Style', 'slider', 'Min', 3, 'Max', 15, 'Value', 3, 'Position', [20 550 120 20], 'Callback', @(src, event)updateFilters(round(src.Value), [], []), 'SliderStep', [1/12 1/12]);

    % Gaussian filter size slider and label
    uicontrol('Style', 'text', 'Position', [160 580 120 20], 'String', 'Gaussian Filter Size');
    uicontrol('Style', 'slider', 'Min', 3, 'Max', 15, 'Value', 3, 'Position', [160 550 120 20], 'Callback', @(src, event)updateFilters([], round(src.Value), []), 'SliderStep', [1/12 1/12]);

    % Gaussian sigma slider and label
    uicontrol('Style', 'text', 'Position', [300 580 120 20], 'String', 'Gaussian Sigma');
    uicontrol('Style', 'slider', 'Min', 0.1, 'Max', 10, 'Value', 1.0, 'Position', [300 550 120 20], 'Callback', @(src, event)updateFilters([], [], src.Value), 'SliderStep', [0.09 0.2]);

    % Nested function to update filters and images based on slider values

    function updateFilters(boxSize, gaussSize, gaussSigma)
        % Default filter sizes and sigma if not provided
        defaultGaussSize = 7; % Default Gaussian filter size
        defaultGaussSigma = 1.0; % Default Gaussian sigma
    
        if ~isempty(boxSize)
            w_box = fspecial('average', [boxSize boxSize]);
            g_box = imfilter(f, w_box, 'replicate');
            subplot(1, 3, 2);
            imshow(g_box);
            title(sprintf('Box Filter %dx%d', boxSize, boxSize));
        end
    
        % Ensure nonempty values for Gaussian parameters
        if isempty(gaussSize)
            gaussSize = defaultGaussSize; % Use default if size is not provided
        end
        if isempty(gaussSigma)
            gaussSigma = defaultGaussSigma; % Use default if sigma is not provided
        end
    
        w_gauss = fspecial('Gaussian', [gaussSize gaussSize], gaussSigma);
        g_gauss = imfilter(f, w_gauss, 'replicate');
        subplot(1, 3, 3);
        imshow(g_gauss);
        title(sprintf('Gaussian Filter %dx%d, \\sigma=%.2f', gaussSize, gaussSize, gaussSigma));
    end

end

