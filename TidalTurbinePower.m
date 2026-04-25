% Setup and Run Tidal Turbine Simulation

% 1. Define parameters 
Cp = 0.35; % Power Coefficient
rho = 1000; % Density of water, kgh/m^3
A = pi * 10^2; % Area of turbine blade
g = 9.81; % Acceleration of gravity, m/s^2

% 2. Open the Simulink Model
modelName = 'TidalTurbine'; % Name of .slx file without the extension
open_system(modelName);

% 3. Run the simulation
disp('Running simulation...');
out = sim(modelName);

% 4. Generate graph
figure('Color', 'w');
plot( out.logsout.get('power').Values.Time,out.logsout.get('power').Values.Data, 'LineWidth', 2, 'Color','r');
grid on;
xlabel('Time (seconds)');
ylabel('Power Output (Watts)');
title('Tidal Turbine Power Analysis');