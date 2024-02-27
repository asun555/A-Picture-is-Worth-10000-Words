function [squareImage] = MakeCipherImage(text,key)
% This function takes text and converts it into a square black and white image
% using a encryption key
% Input: Text, encryption key
% Output: encrypted black and white square image
% Author: Albert Sun UPI: asun555

TwoByNmatrix = [];
cellArray = cell(1,length(text));

for i = 1:length(text)
    
    % get text ascii values
    ASCIIvalues{i} = GetHexASCII(text(i));
    
    % split ascii value in two
    ASCIIvalues{i} = regexp(ASCIIvalues{i},'\w','match');
    
    % convert ascii values to 2 decimal values
    value1 = hex2dec(ASCIIvalues{i}(1,1));
    value2 = hex2dec(ASCIIvalues{i}(1,2));
    
    % put values into key and bring out corresponding graphs
    graph1 = key{value1+1};
    graph2 = key{value2+1};
    
    % put graphs into cell array
    cellArray{i} = [graph1 graph2];
    
    % bring out binary values from cell array and turn into 2x(4*n) matrix
    uint8matrix(1:2,1:4) = cellArray{1,i}(1:2,1:4);
    TwoByNmatrix = [TwoByNmatrix uint8matrix];
    
    % convert 1s to 255s
    TwoByNmatrix(TwoByNmatrix==1)=255;
    
end

% Cutting up matrix and arranging it into a square
squareImage = [];
totelElements = numel(TwoByNmatrix);
amountRowsAndColumns = sqrt(totelElements);

for i = 1:amountRowsAndColumns:(totelElements/2)
    
    % cut out values from TwoByNmatrix
    cutOut = TwoByNmatrix(1:2,i:i+(amountRowsAndColumns-1));
    
    % Lay out values vertically into a square
    squareImage = [squareImage;cutOut];
    
end

% if not a square then display error message
if size(squareImage,1) ~= size(squareImage,2)
    squareImage = 'ERROR';
end

end



