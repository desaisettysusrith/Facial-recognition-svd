clc; clear; close all;

%% STEP 1: LOAD TRAINING DATA

datasetPath = 'train/';   
files = dir(fullfile(datasetPath, '*.jpeg'));
numImages = length(files);

imgSize = [100 100];


% Preallocate matrix to store vectorized training images.
% Each column will hold one image flattened into a column vector of length prod(imgSize).
% Preallocating improves performance by avoiding dynamic resizing inside the loop.
imgVector = zeros(prod(imgSize), numImages);

for i = 1:numImages
    img = imread(fullfile(datasetPath, files(i).name));
    
    if size(img,3) == 3
        img = rgb2gray(img);
    end
    
    % Ensure all training images are the same size as imgSize.
    % imresize scales or crops the image to the desired dimensions so that
    % all image vectors have consistent length for PCA/SVD.
    img = imresize(img, imgSize);
    imgVector(:, i) = double(img(:));
end

%% STEP 2: MEAN & NORMALIZATION

meanFace = mean(imgVector, 2);
A = imgVector - meanFace;

%% STEP 3: APPLY SVD

[U, S, V] = svd(A, 'econ');


k = min(10, size(U,2));   % Use 10 or less

eigenfaces = U(:, 1:k);
projectedImages = eigenfaces' * A;

%% STEP 4: LOAD TEST IMAGE

testImagePath = 'test/test.jpeg';   % Modify if needed
testImg = imread(testImagePath);

if size(testImg,3) == 3
    testImg = rgb2gray(testImg);
end

testImg = imresize(testImg, imgSize);
testVector = double(testImg(:));

%% STEP 5: RECOGNITION

testVector = testVector - meanFace;

projectedTest = eigenfaces' * testVector;

distances = vecnorm(projectedImages - projectedTest);

[minDist, index] = min(distances);

threshold = 5000;

%% STEP 6: OUTPUT

figure;
imshow(testImg);

if minDist < threshold
    title(['Matched with: ', files(index).name]);
else
    title('Unknown Person');
end

 disp(['Minimum Distance: ', num2str(minDist)]);
