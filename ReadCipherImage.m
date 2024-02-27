function [text] = ReadCipherImage(blackwhiteImage,key)
% This function takes a cipher image and it's pattern key to give the text
% that is hidden inside the cipher image.
% Input: black/white cipher image, cell array with 16 uint8 patterns (key)
% Output: Character array containing message hidden inside cipher image
% Author: Albert Sun UPI: asun555

% Convert black and white image into 2xN matrix

TwobyN = [];
matrixWidthLength = size(blackwhiteImage,1);

for i = 1:2:matrixWidthLength
    for j = 1:4:matrixWidthLength
        
        % cut out values from the black and white image
        cutOut = blackwhiteImage(i:i+1,j:j+3);
        
        % Lay out values horizontally into a 2 by N matrix
        TwobyN = [TwobyN cutOut];
        
        % convert 255 values to 1
        TwobyN(TwobyN == 255) = 1;
        
    end
end

% Determine character of each 2x4 block and insert into array

text = [];

for p = 1:4:size(TwobyN,2)
    
    % break 2x4 into 2x2 parts
    binaryChar = TwobyN(1:2,p:p+3);
    
    value1 = binaryChar(1:2,1:2);
    value2 = binaryChar(1:2,3:4);
    
    % match first part of block to corresponding key value and turn into hex value
    for m = 1:16
        if value1 == key{m}
            value1 = dec2hex(m-1);
        end
    end
    
    % match second part of block to corresponding key value and turn into hex value
    for t = 1:16
        if value2 == key{t}
            value2 = dec2hex(t-1);
        end
    end
    
    % combine hex values
    hexChar = [value1, value2];
    
    % turn hex value into character
    decChar = hex2dec(hexChar);
    Char = char(decChar);
    
    % insert character into array
    text = [text Char];
    
end

end

