% Parameters
L = 1; % Length of the box
N = 1000; % Number of grid points
dx = L/N; % Grid spacing
x = linspace(0, L, N); % Grid points
n = 1:3; % Superposition of the first three energy states

% Time settings
T = 10; % Total time
dt = 0.01; % Time step
t = 0:dt:T; % Time vector

% Calculate superposed wave function
psi = zeros(length(n), N);
for j = 1:length(n)
    psi(j, :) = sqrt(2/L) * sin(n(j) * pi * x / L);
end

% Create video
video = VideoWriter('quantum_superposition.mp4', 'MPEG-4');
video.FrameRate = 30;
open(video);

% Generate animation
figure;
for i = 1:length(t)
    psi_t = zeros(1, N);
    for j = 1:length(n)
        time_factor = exp(-1i * (n(j)^2 * pi^2 * t(i)) / (2 * L^2));
        psi_t = psi_t + psi(j, :) * time_factor;
    end

    plot(x, real(psi_t), 'b', x, imag(psi_t), 'r', x, abs(psi_t).^2, 'k');
    xlabel('x');
    ylabel('Wave Function');
    title(['Quantum Superposition at t = ', num2str(t(i))]);
    legend('Real', 'Imaginary', 'Probability Density');
    ylim([-1, 1]);
    drawnow;
    
    frame = getframe(gcf);
    writeVideo(video, frame);
end

close(video);
