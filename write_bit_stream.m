function [bit_stream] = write_bit_stream(input_array)
% concatenate each element in input_array using the fewest number of bit
% possible

[~,nBit] = log2(input_array);
bitArray = cell2mat(arrayfun(@(p) dec2bin(p,max(nBit)),input_array,'UniformOutput',false));
bitArray = [bitArray uint8(nan(1, 8 -  mod(size(bitArray, 2), 8)))+48];

bit_stream = uint8( nan( ceil( size(input_array,2)*max(nBit)/8 ), 1) );
for i = 1:size(bit_stream, 1)
    bit_stream(i) = uint8(   bit2int(bitArray( ((i-1)*8)+(1:8) ))   );
end

end