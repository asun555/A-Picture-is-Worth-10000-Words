% Step 3: Decryption
%
% This script decrypts a character array that has been encrypted and
% embedded into another image.
%
% For this script to work you will need to write the following functions:
% FindCipher, ReadCipherImage
%
% Authors: Duncan Bakke, Peter Bier

hiddenCipherFilename = input('Enter the filename for your hidden cipher image (or hit enter to use hiddenCipher.png):','s');
% Use the default name if one wasn't entered
if isempty(hiddenCipherFilename)
    hiddenCipherFilename = 'hiddenCipher.png'; % no name entered, so default to 'hiddenCipher.png'
end

% Read in the image with the cipher hidden inside it
hiddenCipherImage = imread(hiddenCipherFilename);


keyArrayFilename = input('Enter the filename for your key array (or hit enter to use "key"):','s');
% Use the default name if one wasn't entered
if isempty(keyArrayFilename)
    keyArrayFilename = 'key.mat'; % no name entered, so default to 'key.mat'
end
% Get key to use
load(keyArrayFilename);

% Read in image and extract cipher
hiddenCipher = FindCipher(hiddenCipherImage);

% Decrypt the cipher image using the key
originalText = ReadCipherImage(hiddenCipher,key);

% display the decrypted message
disp(originalText);

