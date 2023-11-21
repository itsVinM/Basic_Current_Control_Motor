clc
clear
close all

%%  Battery using LUT

% LUT PARAMETERS
addpath battery_packs
load('VolkswagenEGolf.mat')   % Can use other battery pack examples by changing the name
R_LUT    = batData.R;         % Internal Series Resistance (ohm)
R_sd     = 1e3;               % Internal Discharging Resistance (ohm)
V_soc_0  = 0.8;               % Battery Initial V_SOC (0 == Full Discharged, 1 == Full Charged) 
C_LUT    = batData.Q * 3600;  % Battery Rated Capacity (As)
V_OC_LUT = batData.Voc;       % V_OC = f(SOC)

% Battery Current to get the full discharge in 1h (active time)
I_LUT    = batData.Q;         % To get the full discharge in 1h (active time)

%% Buck Converter

fsw    = 10000;               % Swicthing Frequency (Hz)

%% RLE Load

k_md = 0.9;                   % (k_md << 1) @ Motoring , (k_md >> 1) @ Generation  
R_in = 0.1;                   % Resistance (ohm)
L_in = 500e-6;                % Inductance (H)
E_in = 180;                   % Back-emf voltage (V)

%% PI Regulator

des_type = 2;   % 1 --> Open Loop Method, 2 --> Closed Loop Method

if (des_type < 1.5)
    % Apply Open Loop Design
    f_ci = fsw / 10;      % Crossover Frequency (Hz) 
    w_ci = 2 * pi * f_ci; % Crossover Pulsation (rad/s)
    kp   = L_in * w_ci;   % Proportional Gain (V/A) 
    w_zi = R_in / L_in;   % PI Zero (rad/s)
    ki   = kp * w_zi;     % Integral Gain (V/A/s) equiavelent to ki = R_in * w_ci;
else
    % Apply Closed Loop Design
    t_d  = 1.5 * (1 / fsw);                 % PWM Delay (s)
    zita = 0.5;                             % Damping Factor [0.5 0.707]
    w_zi = R_in / L_in;                     % PI Zero (rad/s)
    kp   = L_in / (4 * zita * zita * t_d);  % Proportional Gain (V/A) 
    ki   = kp * w_zi;                       % Integral Gain (V/A/s)
end

%% Reference Current

Io_target = 800;   









