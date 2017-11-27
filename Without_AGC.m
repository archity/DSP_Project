CNR = 45;
K = 0.903;
T = 10^-3;  % Integration period

Tj1 = 300 * 10^-6;
Tj2 = 600 * 10^-6;
Tj3 = 900 * 10^-6;
% Duration of pulse interference

JNR = 20 : 80;
% JNR = JNR1 .* 20 .* log10(JNR1);
CNR_post1 = CNR./(K*(1 + Tj1/T * JNR));
CNR_post2 = CNR./(K*(1 + Tj2/T * JNR));
CNR_post3 = CNR./(K*(1 + Tj3/T * JNR));

dB_Scale_Vert1 = 20*log10(CNR_post1);
dB_Scale_Vert2 = 20*log10(CNR_post2);
dB_Scale_Vert3 = 20*log10(CNR_post3);
dB_Scale_Horz = 20*log10(JNR);
% Convert  to log scale for plotting.

figure;
plot(dB_Scale_Horz, dB_Scale_Vert1, dB_Scale_Horz, dB_Scale_Vert2, dB_Scale_Horz, dB_Scale_Vert3);
legend('Tj = 300us', 'Tj = 600us', 'Tj = 600us')
% Plotting all 3 curves wrt JNR axis.
