binary = uint8([255 255 0 0;0 0 0 255;0 0 0 255;0 0 0 255]);
rng(0);
colour = uint8(255.*rand(4,4,3));
hidden = HideCipher(binary,colour);
original = FindCipher(hidden)
