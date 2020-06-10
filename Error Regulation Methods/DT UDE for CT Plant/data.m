close all
clear
clc

global tstep Ts tstop A_n B_n A B xic A_m B_m xmic F_n G_n K Fe T eic udic

tstep = 0.001;
Ts = 0.01;
tstop = 10;

%Nominal Plant Parameters
A_n = [0 1; -2 3];
B_n = [0; 2];

%Actual Plant Parameters
A = [0 1; -1 4];
B = [0; 1.5];
xic = [-2; 1];

%Reference Model Parameters
A_m = [0 1; -6 -5];
B_m = [0; 1];
xmic = [-3; -2];

%Discretization
sys = ss(A_n, B_n, [1 0], 0);
sysD = c2d(sys, Ts);
F_n = sysD.A;
G_n = sysD.B;

%LQR Parameters
Q = eye(2);
R = 1;
K = dlqr(F_n, G_n, Q, R);
Fe = F_n - G_n*K;

T = 0.01;                           %Filter Time Constant
eic = xic - xmic;                   %Error Initial Condition
udic = (-Ts/T)*pinv(G_n)*eic;       %Initial Condition for Robust Control

sim('UDE.slx');
graphUDE