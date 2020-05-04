close all
clear
clc

global a1_n a2_n b_n a1 a2 b Dis K xic T tstep tstop L x_hat_ic

% Plant Parameters as Known
a1_n = -2; 
a2_n = -5;
b_n = 5;

% Actual Plant Parameters
a1 = -1;
a2 = -2;
b = 2;
Dis = 100;

K = [10 50];            % Parameters of Error Dynamics
xic = [-5; -10];        % Initial State
T = 0.01;               % Filter Time Constant

% Observer Parameters
Po = [-20; -20];
L = acker([0 1; a1_n a2_n]', [1; 0], Po);
x_hat_ic = [5; -10];

% Simulation Parameters
tstep = 0.001;          
tstop = 25;

sim('UDE_Test.slx')
graph_Test