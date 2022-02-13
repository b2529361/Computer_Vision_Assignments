pkg load image

function M = black_square(min,max) % return a matrix 
% min is used for minimum length or width of matrix
% max is used for maximum length or width of matrix
m = round(min + (max-min)*rand()); % random length of rows with in the range of min-max 
n = round(min+ (max-min)*rand()); % random length of columns with in the range of min-max 
M = ones(m, n); % create an m x n matrix of ones
min_square_size = 8;
x = round((min_square_size+1) + ((n-min_square_size)-(min_square_size+1))*rand()); % we want a random point within our matrix as a starter, so we get 2 random points x,y
y = round((min_square_size+1) + ((m-min_square_size)-(min_square_size+1))*rand()*rand()); 
max_square_size = round(sqrt(n*m) * .25); 
appropriate_size = false; % a flag that will tell us if the square will be able to fit within the picture, starts as false
while (appropriate_size!=true)
  square_length = round(min_square_size + (max_square_size-min_square_size)*rand());% within range from min_square_size to max_square_size 
  if (x+square_length+2<n && y+square_length+2<m)
    appropriate_size = true;
  endif
endwhile  
i = 1;
while (i<square_length) % we iterate each row
  for (j=1:square_length) % we iterate column
    M(y+j,x+i)=0;
  endfor  
  i = i+1
endwhile
display(square_length);
endfunction

function coordinates = coordinates(I)
I = edge(I,'sobel'); % sobel was one the kernels used for edge detection
end_loop_flag = false; % the code is pretty self explantory, the first set of for loops allows us to get the top right corner and so on
bottom_left_corner= [];
top_right_corner = [];
[r,c]=size(I);
for i=1:r
  if(end_loop_flag == true)
    break;
  endif
  for j=1:c
   element=I(i,j);
   if(element==1) 
    top_right_corner= [j,i];
    end_loop_flag = true;
  endif
endfor
endfor
for i=1:r
  for j=1:c
   element=I(i,j);
   if(element==1) 
    bottom_left_corner= [j,i];
    break;
  endif
endfor
endfor
coordinates =[top_right_corner,bottom_left_corner,size(I)]; % we want to return the top right coordinate to regenerate the image 
endfunction

function transform = two_dimensional_transforms( coordinate,transformation)% takes in coordinates (array), and the type of transformation (string), returns the transformed matrix
m = coordinate(end-1);
n = coordinate(end);
M = zeros(m,n);
y = coordinate(1,3)
x = coordinate(1,2)
a =  round(sqrt(n+m) * .125); 
translate_direction = round(1 + (2-1)*rand()); % where to translate the square 1 = x direction, 2 = y direction
length = coordinate(1,1)-coordinate(1,3) + 2;
b = false; 
translation_quantity = 0;

if(strcmp('translate',transformation) ||strcmp('2Drigidbodymotion',transformation)) % incase we want to rotate and translate, the translation can simply be done like this but we will no longer generate the squre for other transformations
while (b!=true)
 translation_quantity = round(1 + (a-1)*rand()); % how much we want to translate it by 
  if (x+translation_quantity+length+10<n && translate_direction==1)
    b= true;
  endif
  if (y+translation_quantity+length+10<m && translate_direction==2)
    b= true;
  endif
endwhile
if(translate_direction==1)
x = x-translation_quantity; 
elseif(translate_direction==2)
y = y-translation_quantity;
endif  
i = 1;
while (i<length) 
  for (j=1:length) 
    M(y+j,x+i)=1;
  endfor  
  i = i+1
endwhile
endif


if(strcmp('2Drigidbodymotion',transformation))
M = transpose(M); % to rotate 90 degress we first transpose then reverse each row
M = flip(M);
endif



transform = M;
endfunction  


M = black_square(200,200); 
c = coordinates(M)

translation = two_dimensional_transforms(c,'translate'); 
subplot(1,2,1);
imshow(M);
subplot(1,2,2);
imshow(translation);

translation = two_dimensional_transforms(c,'2Drigidbodymotion'); 
subplot(1,2,1);
imshow(M);
subplot(1,2,2);
imshow(translation);
