clc;
clear;

% === Treble Filter - Sallen-Key High-Pass ===

% Component values
R16 = 470e3;   % Ohms
R19 = 336e3;   % Ohms
C6 = 100e-12;  % Farads
C7 = 100e-12;

% Define s-domain variable
s = tf('s');

% Angular cutoff frequency (rad/s)
w0 = 1 / sqrt(R16 * R19 * C6 * C7);

% Quality factor Q
Q = sqrt(R16 * R19 * C6 * C7) / (R16*C7 + R19*C6 + R19*C7);

% Convert to cutoff frequency in Hz
f_cutoff = w0 / (2 * pi);

% Print cutoff frequency
fprintf('Treble filter cutoff frequency: %.2f Hz\n', f_cutoff);

% Sallen-Key high-pass transfer function
H_treble = (s^2) / (s^2 + (w0/Q)*s + w0^2);

% Plot Bode magnitude
bode(H_treble, {100, 1e5});
grid on;
title('Bode Plot of Treble Filter (Sallen-Key High-Pass)');
