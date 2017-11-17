fs = 8*10^6; 
t = ( 0 : 1/fs : (1000/fs-1/fs) );

SNR = 10;   % SNR in dB
snr = 10^(SNR/10);  % Convert to linear scale.
w = (1/sqrt(snr))*randn(size(t));
plot(w);

%%
% Generate a sine wave and add noise to it.
fc = 100;   % Carrier freq: 100Hz
t = ( 0 : 1/fs : (1000/fs-1/fs) )'; %Time: 0-1000s.
x = sin(2*pi*fc*t);
noiseSignal = x + w;
plot(x+w);

%%
% White Gaussian Noise (WGN) using built-in function.
y = awgn(x, snr);
plot(y);
