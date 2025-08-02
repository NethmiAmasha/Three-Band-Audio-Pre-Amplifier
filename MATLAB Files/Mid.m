clc;
clear;

% === Stage A: High-Pass Filter ===

% Component values from image
R6 = 560e3;  % Ohms
R9 = 560e3;
C2 = 680e-12; % Farads
C3 = 680e-12;

% Cutoff frequency for High-pass filter
f_hp_cutoff = 1 / (2*pi*sqrt(R6 * R9 * C2 * C3));

% Transfer function
s = tf('s');
w_hp = 2 * pi * f_hp_cutoff;
H_hp = (s / w_hp) / (1 + s / w_hp);  % 2nd order high-pass simplified approx

% === Stage B: Low-Pass Filter ===

% Component values from image
R12 = 280e3;
R13 = 560e3;
C4 = 150e-12;
C5 = 150e-12;

% Angular cutoff and Q-factor (Sallen-Key)
w0 = 1 / sqrt(R12 * R13 * C4 * C5);
f_lp_cutoff = w0 / (2*pi);
Q = sqrt(R12 * R13 * C4 * C5) / (R12*C5 + R13*C4 + R13*C5);

% Sallen-Key low-pass transfer function
H_lp = w0^2 / (s^2 + (w0/Q)*s + w0^2);

% === Total Mid Filter = HPF followed by LPF ===
H_total = H_hp * H_lp;

% === Bode Plot ===
[mag, phase, w] = bode(H_total, {100, 1e5});
mag_db = squeeze(20*log10(mag));
phase_deg = squeeze(phase);
f = w / (2*pi); % Frequency in Hz

% Plot
figure('Name','Mid Filter Bode Plot','Position',[100 100 800 600]);

subplot(2,1,1)
semilogx(f, mag_db, 'b', 'LineWidth', 1.5)
grid on; grid minor
ylim([-80 5])
ylabel('Magnitude (dB)')
title('Bode Plot of Mid Filter (Stage-A HPF + Stage-B LPF)')

subplot(2,1,2)
semilogx(f, phase_deg, 'r', 'LineWidth', 1.5)
grid on; grid minor
ylim([-180 60])
ylabel('Phase (deg)')
xlabel('Frequency (Hz)')

% === Display Cutoff Frequencies ===
fprintf('High-pass cutoff frequency: %.2f Hz\n', f_hp_cutoff);
fprintf('Low-pass cutoff frequency:  %.2f Hz\n', f_lp_cutoff);
