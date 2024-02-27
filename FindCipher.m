function [cipherImage] = FindCipher(image)
% This function takes an image with a cipher binary image embedded inside
% it and extracts the cipher image
% Input: image with a cipher binary image embedded inside
% Output: cipher binary image
% Author: Albert Sun UPI: asun555

%% Access bottom right pixel for width/length of binary ciper image

% Access length and width of image
imageLength = size(image,1);
imageWidth = size(image,2);

% Add values of bottom right pixels together for width/length of binary ciper image
binaryWidth = double(image(imageLength,imageWidth,1)) + double(image(imageLength,imageWidth,2)) + double(image(imageLength,imageWidth,3));

%% Assign values to binary ciper image

% Define values of rgb in order to sum then for if they are odd/even
red = image(:,:,1);
green = image(:,:,2);
blue = image(:,:,3);
binary = [];
rgbSum = zeros();

for i = 1:binaryWidth
    for j = 1:binaryWidth
        
        % Take sum of rgb value
        rgbSum(i,j) = double(red(i,j)) + double(green(i,j)) + double(blue(i,j));
        
        % If odd number then pixel is black
        if mod(rgbSum(i,j),2) == 1
            
            binary = [binary uint8(0)];
            
        % If otherwise then pixel is white
        else
            
            binary = [binary uint8(255)];
            
        end
        
    end
    
end

%% Turn values into n by n uint8 matrix

% Define cipher image dimensions 
cipherImage = [];
totelElements = numel(binary);

for i = 1:binaryWidth:totelElements
    
    % cut out values from binary
    cutOut = binary(1,i:i+(binaryWidth-1));
    
    % Lay out values vertically into a square
    cipherImage = [cipherImage;cutOut];
    
end

end

