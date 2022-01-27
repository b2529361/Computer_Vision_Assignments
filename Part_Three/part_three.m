pkg load image
sample_image = imread("cat.png");

function lower_greyscale_level (image,level)
  greyscaled_input_image = rgb2gray(image);
  if(level>255)
      return;
  endif
  transformed_input_image = floor(greyscaled_input_image/level)*level; % I hope its this simple
  imshow(transformed_input_image);
endfunction 
lower_greyscale_level(sample_image,22)
lower_greyscale_level(sample_image,252)