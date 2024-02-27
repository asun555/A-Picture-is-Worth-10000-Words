% Step 1: Creating a key
%
% This script calls two functions that you will write, using them to
% create a key of binary patterns with which to encrypt (or decrypt) 
% a message.
% For this script to work you will need to write the following functions:
% CreatePatterns, CreatePatternKey.
%
% Authors: Duncan Bakke, Peter Bier

% Generate an array with the values 1:16 inclusive, in a random order.
randomArray = randperm(16);

% Generate sixteen 2x2 patterns of uint binary (0 and 1) values, storing 
% them in a 1D 16x1 cell array.
p = CreatePatterns(); % You will write this function

% Create a similar cell array of patterns to act as a key, by rearranging
% the original array according to the random array order.
key = CreatePatternKey(p,randomArray); % You will write this function

% Ask user for an identifier with which to save this key.
keyName = input('What would you like to name your key? (or hit enter to use "key"):','s');
if isempty(keyName)
    keyName = 'key'; % no name entered, so default to 'key'
end

% Save the key array under that name.
save([keyName '.mat'],'key');

