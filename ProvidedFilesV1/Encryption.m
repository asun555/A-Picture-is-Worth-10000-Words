% Step 2: Encryption
%
% This script encrypts a character array into a binary image, using a key
% that has been generated and then saved.  The resulting cipher image is
% then embedded within a colour image to hide it.
% 
% For this script to work you will need to write the following functions:
% MakeCipherImage, GetHexASCII, HideCipher
%
% Authors: Duncan Bakke, Peter Bier

%NOTE: Before running this script, you must set the variable charArray to
%be the character array you wish to encrypt. A fix for this is forthcoming.

% Note also that this array must be "squarable"! This is defined as:
% numChar = length(charArray)
% mod(sqrt(numChar*8),4) = 0
% a few lengths that work with this are: 2 8 18 32 50 72 98 128 162 200

if ~exist('charArray')
   charArray = 'defaulty'; 
end

keyArrayFilename = input('Enter the filename for your key array (or hit enter to use "key"):','s');
% Use the default name if one wasn't entered
if isempty(keyArrayFilename)
    keyArrayFilename = 'key.mat'; % no name entered, so default to 'key.mat'
end

% Get key to use
load(keyArrayFilename);

% Use key to encrypt the character array into a binary image
cipherArray = MakeCipherImage(charArray,key);% You will write this function (and you might call GetHexASCII inside it)

% Hide the array inside a colour image.
colourArrayFilename = input('Enter the filename for the image you want to hide it in (or hit enter to use "default.jpg"):','s');
if isempty(colourArrayFilename)
    colourArrayFilename = 'default.jpg'; % no name entered, so default to 'default.png'
end

% Read in the colour image for use.
colourArray = imread(colourArrayFilename);

% Hide the cipher inside the colour image
hiddenImage = HideCipher(cipherArray,colourArray); % You will write this function

hiddenFilename = input('Enter the filename for your hidden cipher image (or hit enter to use hiddenCipher.jpg):','s');

% Use the default name if one wasn't entered
if isempty(hiddenFilename)
    hiddenFilename = 'hiddenCipher.png'; % no name entered, so default to 'hiddenCipher.png'
end

imwrite(hiddenImage,hiddenFilename);

% Display the cipher and hidden images
figure(2)
subplot(1,2,1);
imshow(255*uint8(cipherArray))
title('Cipher image');
subplot(1,2,2);
imshow(hiddenImage);
title('hidden image')



