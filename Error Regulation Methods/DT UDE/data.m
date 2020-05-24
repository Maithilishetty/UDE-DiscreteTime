close all
clear
clc

global tstep tstop F_n G_n F G xic F_m G_m xmic K Fe T eic udic

tstep = 0.01;
tstop = 10;

%Nominal Plant Parameters
F_n = [0 1; 0.6 -0.8];
G_n = [0; 1.5];

%Actual Plant Parameters
F = [0 1; 0.4 -0.5];
G = [0; 1.2];
xic = [-2; 1];

%Reference Model Parameters
F_m = [0 1; -0.5 0.5];
G_m = [0; 1];
xmic = [-3; -2];

%LQR Parameters
Q = eye(2);
R = 2;
K = dlqr(F_n, G_n, Q, R);
Fe = F_n - G_n*K;

T = 0.01;           %Filter Time Constant
eic = xic - xmic;   %Error Initial Condition
udic = (-tstep/T)*pinv(G_n)*eic;

sim('DT_UDE.slx');
graphDT