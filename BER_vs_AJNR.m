%BER vs AJNR

CNR = 45;
K = 0.903;
T = 10^-3;  % Integration period

Tj1 = 300 * 10^-6;
Tj2 = 600 * 10^-6;
Tj3 = 900 * 10^-6;
% Duration of pulse interference

JNR = 20 : 5000;
DutyCycle1 = Tj1/T;
DutyCycle2 = Tj2/T;
DutyCycle3 = Tj3/T;
% The ratio Tj/T is the duty cycle.

AJNR = JNR * DutyCycle1;
% AJNR is obtained by multiplying JNR with duty ratio.

CNR_post1 = CNR./(K*(1 + Tj1/T * JNR));
p_b = 0.5 * erfc(sqrt(CNR_post1));

dB_Scale_Vert = (p_b);
dB_Scale_Horz = (AJNR)./(20*log10(AJNR));

figure;
plot(dB_Scale_Horz, dB_Scale_Vert);
