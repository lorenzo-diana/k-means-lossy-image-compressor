function [ output_image_RGB, idx, C  ] = compress_RGB( compression_level, input_image_RGB )
% open a file contain an image and compress it deleting colours
% the number of colours in the compressed image is 2^compression_level
% accepted value for compression_level goes from 1 to 8

if sum(compression_level == 1:8) ~= 1
    error('Compression level must be between 1 and 8 !');
end

k_means_data = double(reshape(input_image_RGB, [size(input_image_RGB, 1)*size(input_image_RGB, 2), size(input_image_RGB, 3)]));

% number of used clusters -> number of different colours the compressed image
% will have
num_cluster = 2^compression_level;
switch compression_level
    case {1, 2, 3} % 2 to 8 clusters
        num_replicates = 50;
    case 4         % 16 clusters
        num_replicates = 30;
    case {5, 6}    % 32 or 64 clusters
        num_replicates = 15;
    case {7, 8}    % 128 or 256 clusters
        num_replicates = 5;
end

[idx, C] = kmeans(k_means_data, num_cluster, 'Replicates', num_replicates, 'MaxIter', 500);

compressed_imgage = uint8( C(idx, :) );

output_image_RGB = reshape(compressed_imgage, [size(input_image_RGB, 1), size(input_image_RGB, 2), size(input_image_RGB, 3)]);

end