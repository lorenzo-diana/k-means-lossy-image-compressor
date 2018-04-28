function [out] = read_bit_stream(bit_stream, size_out, num_bit)
% read each subsequent set of num_bit bits from bit_stream to build size_out
% elements vector

z = 1;
out = uint8( nan(size_out, 1) );

stream=dec2bin(bit_stream)';
stream=stream(:);

for i = 1:num_bit:size(stream,1)
    out(z) = bit2int([repmat('0', 8-num_bit, 1); stream(i:(i+num_bit-1))]);
    if z == size_out
        return;
    end
    z = z+1;
end

end

