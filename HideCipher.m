function [alteredImage] = HideCipher(binary,colorImage)
% This function hides a black and white cipher image in a colored image.
% Also alters bottom right pixel of image's RGB values to add to cipher
% image width.
% Input: binary cipher image, color image
% Output: colored image with binary cipher image hidden inside
% Author: Albert Sun UPI: asun555

red = colorImage(:,:,1);
green = colorImage(:,:,2);
blue = colorImage(:,:,3);
alteredImage = colorImage;
rgbSum = zeros();

for i = 1:size(binary,1)
    for j = 1:size(binary,2)
        
        % take sum of all rgb values
        rgbSum(i,j) = double(red(i,j)) + double(green(i,j)) + double(blue(i,j));
        
        % if binary is black and rgbsum is even, alter by 1
        if binary(i,j) == 0 && mod(rgbSum(i,j),2) == 0
            
            red(i,j) = AlterByOne(red(i,j));
            
        end
        
        % if binary is white and rgbsum is odd, alter by 1
        if binary(i,j) == 255 && mod(rgbSum(i,j),2) == 1
            
            red(i,j) = AlterByOne(red(i,j));
            
        end
        
        % put altered red values into new altered image
        alteredImage(i,j,1) = red(i,j);
        
    end
    
end

% Assign last pixel to add to binary cipher image width

% Get size of binary image width
binaryWidth = size(binary,2);

% change red pixel to binary width
redLength = size(red,1);
redWidth = size(red,2);
alteredImage(redLength,redWidth,1) = binaryWidth;

% change green pixel to 0
greenLength = size(green,1);
greenWidth = size(green,2);
alteredImage(greenLength,greenWidth,2) = 0;

% change blue pixel to 0
blueLength = size(blue,1);
blueWidth = size(blue,2);
alteredImage(blueLength,blueWidth,3) = 0;

end
