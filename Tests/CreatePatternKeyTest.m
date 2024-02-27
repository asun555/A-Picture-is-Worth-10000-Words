patternArray = CreatePatterns();
patternKeyIdentical = CreatePatternKey(patternArray,[1:16]);
patternKeyIdentical{1} == patternArray{1}

patternKeyInverted = CreatePatternKey(patternArray,[4 5 1 3 2 6 7 9 8 14 12 13 10 16 15 11]);
patternKeyInverted{2} == patternArray{5}

