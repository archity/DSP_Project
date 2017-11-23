CNR = 45;
K = 0.903;
T = 10^-3;  % Integration period
Tj = 900*10^-6; % Duration of pulse interference

JNR = 20 : 80;
SINR_post = CNR./(K*(1/T + Tj/T^2 * JNR));

dB_Scale = 20*log10(SINR_post);

figure;
plot(JNR, dB_Scale);