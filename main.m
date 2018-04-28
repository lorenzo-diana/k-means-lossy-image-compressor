% Simple script to exploit k-means algorithm to compress an image deleting some
% of its colours

% parameters
compression_level = 2;
input_file_name = 'input.bmp';

input_image = imread(input_file_name);

[output_image, idx, C] = compress_RGB(compression_level, input_image);

% save compressed file to file
write_compressed_image(input_file_name, output_image, idx, C);

% read compressed file from file
[output_image_2, size_1, size_2, idx_in, C_in] = read_compressed_image(input_file_name);

% display original image
figure
image(input_image);
pbaspect([size(input_image,2) size(input_image,1) 1]);

% display compressed image
figure
image(output_image_2);
pbaspect([size_2 size_1 1]);

% save image using the same format of the input file
imwrite(output_image_2, ['compressed_' input_file_name]);