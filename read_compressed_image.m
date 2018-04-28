function [output_image_2, size_1, size_2, idx_in, C_in] = read_compressed_image( input_file_name )
% read from file all the information needed to represent the image and build it

in_compressed_image = fopen(['compressed_' input_file_name '.bin'], 'r');
if in_compressed_image == -1
	error('Cannot open input file');
end

size_1 = fread(in_compressed_image, 1, 'uint32');
size_2 = fread(in_compressed_image, 1, 'uint32');
size_C_in = fread(in_compressed_image, 1, 'uint32');
C_in = fread(in_compressed_image, [size_C_in 3], 'uint8');
bit_stream_len = (log2(size_C_in)*(size_1*size_2));
if mod(bit_stream_len, 8) ~= 0
    bit_stream_len = bit_stream_len + 8-mod(bit_stream_len,8);
end
bit_stream = fread(in_compressed_image, bit_stream_len, 'uint8');
idx_in = read_bit_stream(bit_stream, size_1*size_2, log2(size_C_in));
idx_in = idx_in + 1;

fclose(in_compressed_image);

% build image to be returned
compressed_imgage = uint8( C_in(idx_in, :) );
output_image_2 = reshape(compressed_imgage, [size_1, size_2, 3]);

end