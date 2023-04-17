% Parameters
A1 = 1; % Amplitude of the first wave
A2 = 1; % Amplitude of the second wave
k1 = 2*pi/5; % Wavenumber of the first wave
k2 = 2*pi/6; % Wavenumber of the second wave
phi1 = 0; % Phase of the first wave
phi2 = pi/2; % Phase of the second wave

% Time and space vectors
t = linspace(0, 2*pi, 1000);
x = linspace(0, 20, 1000);
[T, X] = meshgrid(t, x);

% Calculate individual waves
wave1 = A1 * cos(k1*X + phi1);
wave2 = A2 * cos(k2*X + phi2);

% Superposition of the two waves
superposed_wave = wave1 + wave2;

% Plot the waves and the superposed wave
figure;
subplot(3, 1, 1);
imagesc(t, x, wave1);
colormap('jet');
colorbar;
title('Wave 1');
xlabel('Time');
ylabel('Position');

subplot(3, 1, 2);
imagesc(t, x, wave2);
colormap('jet');
colorbar;
title('Wave 2');
xlabel('Time');
ylabel('Position');

subplot(3, 1, 3);
imagesc(t, x, superposed_wave);
colormap('jet');
colorbar;
title('Superposed Wave (Quantum Superposition)');
xlabel('Time');
ylabel('Position');

% Adjust the layout
tight_layout();
