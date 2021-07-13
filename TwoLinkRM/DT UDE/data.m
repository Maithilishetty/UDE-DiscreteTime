close all
clear
clc

global tstep Ts tstop m1 m2 l1 l2 g mu1 mu2 A_n B_n xic A_m B_m xmic F_n G_n K Fe T eic udic

tstep = 0.001;
Ts = 0.001;
tstop = 10;

%System Parameters
m1 = 2; m2 = 1; l1 = 2; l2 = 1; g = 9.8;

mu1 = inv(m1*l1*l1 + m2*(l1+l2)*(l1+l2));
mu2 = inv(m2*l2*l2);

%Nominal Plant Parameters
A_n = blkdiag([0 1; 0 0], [0 1; 0 0]);
B_n = [0 0; mu1 0; 0 0; 0 mu2];
xic = zeros(4, 1);

%Reference Model Parameters
A_m = blkdiag([0 1; -2 -3], [0 1; -2 -3]);
B_m = [0 0; 1 0; 0 0; 0 1];
xmic = zeros(4, 1);

%Discretization
sys = ss(A_n, B_n, [1 0 0 0; 0 0 1 0], 0);
sysD = c2d(sys, Ts);
F_n = sysD.A;
G_n = sysD.B;

%Discretization of Model
sys = ss(A_m, B_m, [1 0 0 0; 0 0 1 0], 0);
sysD = c2d(sys, Ts);
F_m = sysD.A;
G_m = sysD.B;

%Controller Parameters
K = place(F_n, G_n, eig(F_m));
Fe = F_n - G_n*K;

T = 0.01;                           %Filter Time Constant
eic = xic - xmic;                   %Error Initial Condition
udic = (-Ts/T)*pinv(G_n)*eic;       %Initial Condition for Robust Control

sim('DT_UDE.slx');
graphDT