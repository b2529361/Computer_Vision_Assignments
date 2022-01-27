pkg load image
my_image = imread("heidi.png");
my_image_matrix_demensions = size(my_image);
altered_matrix_demensions = ceil(my_image_matrix_demensions/2);
a = altered_matrix_demensions
transformed_image = imresize(my_image,a(1, [1, 2]),'nearest');
imshow(transformed_image); 
transformed_image = imresize(my_image,a(1, [1, 2]),'linear');
imshow(transformed_image); 
transformed_image = imresize(my_image,a(1, [1, 2])); % bicubic or cubic is the default optional param
imshow(transformed_image); 

% for some reason it did not work 