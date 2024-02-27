function [ASCIIvalues] = GetHexASCII(Text)
% This function converts a string of text into their ASCII value and returns the
% values in a nx2 character array
% Input: 1D character array of any length (n)
% Output: 2D character array where each row is two hex digits
% Author: Albert Sun UPI: asun555

n = length(Text);
HexValues = cell(n,1);

% Run an nth amount of times, once for each character in the array
for i = 1:n
    
    % Convert letters into ASCII hex value
    HexValues{i} = dec2hex(double(Text(i)),2);
    
    % Insert hex value into output array
    ASCIIvalues = vertcat(HexValues{:});
    
end
end
