function [cellArray] = CreatePatterns()
% This function stores 16 2x2 uint8 patterns for key generation
% Input: nothing Output: preset array of 2x2 patterns
% Author: Albert Sun UPI: asun555

% Create cell array
cellArray = cell(16,1);

% Define each pattern and store
Pattern1 = uint8([0 1;1 1]);
cellArray{1} = Pattern1;

Pattern2 = uint8([1 0;1 1]);
cellArray{2} = Pattern2;

Pattern3 = uint8([1 1;0 1]);
cellArray{3} = Pattern3;

Pattern4 = uint8([1 1;1 0]);
cellArray{4} = Pattern4;

Pattern5 = uint8([0 0;1 1]);
cellArray{5} = Pattern5;

Pattern6 = uint8([0 1;0 1]);
cellArray{6} = Pattern6;

Pattern7 = uint8([0 1;1 0]);
cellArray{7} = Pattern7;

Pattern8 = uint8([1 0;0 1]);
cellArray{8} = Pattern8;

Pattern9 = uint8([1 0;1 0]);
cellArray{9} = Pattern9;

Pattern10 = uint8([1 1;0 0]);
cellArray{10} = Pattern10;

Pattern11 = uint8([0 0;0 1]);
cellArray{11} = Pattern11;

Pattern12 = uint8([0 0;1 0]);
cellArray{12} = Pattern12;

Pattern13 = uint8([0 1;0 0]);
cellArray{13} = Pattern13;

Pattern14 = uint8([1 0;0 0]);
cellArray{14} = Pattern14;

Pattern15 = uint8([0 0;0 0]);
cellArray{15} = Pattern15;

Pattern16 = uint8([1 1;1 1]);
cellArray{16} = Pattern16;

end

