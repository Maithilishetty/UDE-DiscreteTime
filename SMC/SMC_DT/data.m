close all
clear
clc

global tstep tstop A_n B_n A B xic F_m G_m xmic G 

tstep = 0.01;
tstop = 10;

%Nominal Plant Parameters
A_n = [0 1; 0.6 -0.8];
B_n = [0; 1.5];

%Actual Plant Parameters
A = [0 1; 0.4 -0.5];
B = [0; 1.2];
xic = [-2; 1];

%Hyperplane matrix 
G = [0; 1];

%Reference Model Parameters
F_m = [0 1; -0.5 -0.1];
G_m = [0; 1];
xmic = [-3; -2];

sim('smc.slx');
graph_smc