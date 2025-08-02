clc;
clear;

% === Bass Filter - Sallen-Key Low Pass ===

% Component values
R4 = 560e3;   % Ohms
R5 = 47e3;   % Ohms
C1 = 1.2e-9;   % Farads
C8 = 18e-9;   % Farads

% Define s-domain variable
s = tf('s');

% Calculate angular cutoff frequency (rad/s)
omega0 = 1 / sqrt(R4 * R5 * C1 * C8);

% Quality factor Q
Q = sqrt(R4 * R5 * C1 * C8) / (R4 * C8 + R5 * C1);

% Convert to cutoff frequency in Hz
f_cutoff = omega0 / (2 * pi);

% Correct way to print to Command Window
fprintf('Bass filter cutoff frequency: %.2f Hz\n', f_cutoff);

% Construct Sallen-Key low-pass transfer function
H_bass = omega0^2 / (s^2 + (omega0/Q)*s + omega0^2);

% Plot Bode magnitude
bode(H_bass, {10, 1e4});
grid on;
title('Bode Plot of Bass Filter (Sallen-Key Low Pass)');
