pkg load image
sample_image = imread("geese.png"); % reads the image for proccesing
imshow(sample_image); % we display the image 
greyscaled_sample_image = rgb2gray(sample_image); % this function turn the image to grey scale
imshow(greyscaled_sample_image); % we show the greyscaled image
sample_image_px_count = numel(sample_image); % this function counts the amount of pixels in the image px_count = 721920
sample_image_min = min(min(min(sample_image))); % returns a min value
sample_image_max = max(max(max(sample_image))); % returns a max value
sample_image_mean = mean(mean(mean(sample_image))); % returns a matrix of all mean values in rows
disp(sample_image_px_count); % prints to console the px_count
disp(sample_image_min); 
disp(sample_image_max);
printf("sample mean  = %d",sample_image_px_count);

sample_image = greyscaled_sample_image; % we set the original image to the greyscaled version
sample_image_transform = sample_image; % we dont want to overide the transfprmation so we save sample_image in a new variable
sample_image_transform(sample_image>sample_image_mean) = 1; % as asked on the assignment, for all values greater than the mean the pixel values will equal zero
sample_image_transform(sample_image<sample_image_mean) = 0; % as above but if it less than the mean

figure() % we create a figure in which we will plot the greyscaled image and the transformed image
subplot(1,2,1)
imshow(sample_image,[])
title('Original greyscaled geese image')
subplot(1,2,2)
imshow(sample_image_transform,[])
title('Transformed image')
