function [] = write_compressed_image( input_file_name, output_image, idx, C )
% save to file all the information needed to represent the image

%     VALUE            BIT
%size(input_image,1)   32
%size(input_image,2)   32
%size(C)               32
%uint8(C)              8 (each component)
%uint8(idx)            numel(idx)*log2(numel(C)) rounded to the nearest multiple
%                      of 8 greater than or equal to that value

out_compressed_image = fopen(['compressed_' input_file_name '.bin'], 'w');
if out_compressed_image == -1
	error('Cannot open output file');
end

fwrite(out_compressed_image, size(output_image,1), 'uint32');
fwrite(out_compressed_image, size(output_image,2), 'uint32');
fwrite(out_compressed_image, size(C,1), 'uint32');
fwrite(out_compressed_image, uint8(C), 'uint8');
bit_stream = write_bit_stream((idx-1)');
fwrite(out_compressed_image, uint8(bit_stream), 'uint8');

fclose(out_compressed_image);

end