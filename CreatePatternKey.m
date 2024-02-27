function [newArray] = CreatePatternKey(patternArray,newOrder)
% This function rearranges a preset pattern array based on a 16x1 array of integers
% describing the new order
% Input: preset array of 2x2 patterns, array of 16 numbers in different orders
% Output: array of 2x2 patterns set in new order
% Author: Albert Sun UPI: asun555

newArray = cell(16,1);

% Run 16 times, once for each value
for i = 1:16
    
    % Insert rearranged values into the new array
    newArray{i} = patternArray{newOrder(i)};
    
end
end

