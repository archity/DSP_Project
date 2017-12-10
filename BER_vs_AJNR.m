%BER vs AJNR in the absence of AGC


Tj(1) = 300 * 10^-6;
Tj(2) = 600 * 10^-6;
Tj(3) = 900 * 10^-6;
% Duration of pulse interference

JNR = 20 : 4000;
% Jamming to Noise Ratio

AJNR = zeros(1, 4000-20+1);
BER = zeros(1, 4000-20+1);
% Preallocate with zeros

for i = 1 : 3
    [AJNR_OP, BER_OP] = Func_AJNR_BER(Tj(i), JNR);
    % User defined function present in the script itself.
    
    AJNR(i, :) = AJNR_OP;
    BER(i, :) = BER_OP;
    % 3 arrays of AJNR and BER for 3 different values of duty ration stored
    % in the variables above.
end

Scale_Vert1 = (BER(1, :));
dB_Scale_Horz1 = (AJNR(1, :))./(20*log10(AJNR(1, :)));
Scale_Vert2 = (BER(2, :));
dB_Scale_Horz2 = (AJNR(2, :))./(20*log10(AJNR(2, :)));
Scale_Vert3 = (BER(3, :));
dB_Scale_Horz3 = (AJNR(3, :))./(20*log10(AJNR(3, :)));
% Horizontal scale is divided by log so as to plot AJNR/dB.

figure;
plot(dB_Scale_Horz1, Scale_Vert1, dB_Scale_Horz2, Scale_Vert2, dB_Scale_Horz3, Scale_Vert3);
% Plot all 3 curves wrt AJNR axis in one graph.

legend('DutyCycle = 0.3', 'DutyCycle = 0.6', 'DutyCycle = 0.9');
title('BER vs AJNR in the absence of AGC');
xlabel('AJNR/dB'); ylabel('Bit Error Rate (BER)');
%--------------------------------------------------------------------------

function [ AJNR, BER ] = Func_AJNR_BER( Tj, JNR )
    CNR = 45;   % Carrier to Noise Ratio
    K = 0.903;
    T = 10^-3;  % Integration period
    
    CNR_post = CNR./(K*(1 + Tj/T * JNR));
    BER = 0.5 * erfc(sqrt(CNR_post));
    DutyCycle = Tj/T;
    % The ratio Tj/T is the duty cycle.

    AJNR = JNR * DutyCycle;
    % AJNR is obtained by multiplying JNR with duty ratio.
end
