close all
clear
clc

global tstep Ts tstop r2d A_n B_n A B xic A_m B_m xmic F_n G_n K Fe T eic udic L F_m G_m xhat_ic

tstep = 0.001;
Ts = 0.01;
tstop = 10;

r2d = 180/pi;

%Nominal Plant Parameters
A_n = [0 1; -26.7 0.765];
B_n = [0; 0.75*r2d];

%Actual Plant Parameters
A = [0 1; -20 1];
B = [0; 0.5*r2d];
xic = [pi/9; 0];

%Reference Model Parameters
A_m = [0 1; -6 -5];
B_m = [0; 1];
xmic = [0; 0];

%Discretization
sys = ss(A_n, B_n, [1 0], 0);
sysD = c2d(sys, Ts);
F_n = sysD.A;
G_n = sysD.B;

%Discretization of model
sys = ss(A_m, B_m, [1 0], 0);
sysD = c2d(sys, Ts);
F_m = sysD.A;
G_m = sysD.B;

%LQR Design
Q = eye(2);
R = 2;
K = dlqr(F_n, G_n, Q, R);
Fe = F_n - G_n*K;

%Observer Parameters
L = acker(F_n', [1 0]',[0; 0])';
xhat_ic = [pi/9; 0];

T = 2*Ts;                           %Filter Time Constant
eic = xic - xmic;                   %Error Initial Condition
udic = (-Ts/T)*pinv(G_n)*eic;       %Initial Condition for Robust Control

sim('WR_UDE.slx');
graphUDE