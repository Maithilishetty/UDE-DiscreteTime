close all
clear
clc

global tstep tstop A_n B_n A B xic A_m B_m xmic K Ae T eic

tstep = 0.001;
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

%LQR Parameters
Q = eye(2);
R = 2;
K = lqr(A_n, B_n, Q, R);
Ae = A_n - B_n*K;

T = 0.01;           %Filter Time Constant
eic = xic - xmic;   %Error Initial Condition

sim('CT_UDE.slx');
graphCT