function [alteredValue] = AlterByOne(Value)
% This function adds 1 to a uint8 value in range 0 to 255, unless value is 255 where it
% subtracts 1
% Input: uint8 value Output: uint8 value + 1
% Author: Albert Sun UPI: asun555

% if the number is 255 then minus 1
if Value == 255
    alteredValue = uint8(254);

    % otherwise add 1
else
    alteredValue = uint8(Value) + uint8(1);
end
