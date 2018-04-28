function [out] = bit2int(in)
% in:  input, cell array containing (at least) 8 element. Each element must
%      contain 1 or 0.
% out: output, 8 bit integer composed of
%      {in[8], in[7], in[6], in[5], in[4], in[3], in[2], in[1]}

res = 0;
for i = 1:8
    res = bitor(res, bitshift(uint8(in(9-i))-48, (i-1)) );
end
out = uint8(res);

end

