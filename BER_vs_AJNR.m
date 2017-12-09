%BER vs AJNR


Tj(1) = 300 * 10^-6;
Tj(2) = 600 * 10^-6;
Tj(3) = 900 * 10^-6;
% Duration of pulse interference

JNR = 20 : 4000;
AJNR = zeros(1, 4000-20+1);
BER = zeros(1, 4000-20+1);
for i = 1 : 3
    [AJNR_OP, BER_OP] = Func_AJNR_BER(Tj(i), JNR);
    AJNR(i, :) = AJNR_OP;
    BER(i, :) = BER_OP;
end

Scale_Vert1 = (BER(1, :));
dB_Scale_Horz1 = (AJNR(1, :))./(20*log10(AJNR(1, :)));
Scale_Vert2 = (BER(2, :));
dB_Scale_Horz2 = (AJNR(2, :))./(20*log10(AJNR(2, :)));
Scale_Vert3 = (BER(3, :));
dB_Scale_Horz3 = (AJNR(3, :))./(20*log10(AJNR(3, :)));

figure;
plot(dB_Scale_Horz1, Scale_Vert1, dB_Scale_Horz2, Scale_Vert2, dB_Scale_Horz3, Scale_Vert3);
legend('DutyCycle = .3', 'DutyCycle = .6', 'DutyCycle = .9')
% Plotting all 3 curves wrt AJNR axis.

function [ AJNR, BER ] = Func_AJNR_BER( Tj, JNR )
    CNR = 45;
    K = 0.903;
    T = 10^-3;  % Integration period
    
    CNR_post = CNR./(K*(1 + Tj/T * JNR));
    BER = 0.5 * erfc(sqrt(CNR_post));
    DutyCycle = Tj/T;
    % The ratio Tj/T is the duty cycle.

    AJNR = JNR * DutyCycle;
    % AJNR is obtained by multiplying JNR with duty ratio.
end
