close all
clear
clc

global tstep tstop A_n B_n A B xic F_m G_m xmic G A_m B_m F_n G_n Ts

tstep = 0.001;
Ts = 0.01;
tstop = 20;

%Nominal Plant Parameters
A_n = [0 1; -2 3];
B_n = [0; 2];

%Actual Plant Parameters
A = [0 1; 1 5];
B = [0; 1];
xic = [-2; 1];

%Hyperplane matrix 
G = [0; 1];

%Reference Model Parameters
A_m = [0 1; -6 -5];
B_m = [0; 1];
xmic = [-3; -2];

%Discretization
sys = ss(A_n, B_n, [1 0], 0);
sysD = c2d(sys, Ts);
F_n = sysD.A;
G_n = sysD.B;

%Discretization of Model
sys = ss(A_m, B_m, [1 0], 0);
sysD = c2d(sys, Ts);
F_m = sysD.A;
G_m = sysD.B;

sim('smc_ct.slx');
graphsmc_ct