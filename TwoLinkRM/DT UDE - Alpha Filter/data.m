close all
clear
clc

global Ts tstop m1 m2 l1 l2 g m1a m2a l1a l2a mu1 mu2 mu1a mu2a A_n B_n xic
global A_m B_m xmic F_n G_n F_m G_m K L xhatic operric T alpha

Ts = 0.001;
tstop = 10;

%System Parameters
m1 = 2; m2 = 1; l1 = 2; l2 = 1; g = 9.8;
m1a = 2.4; m2a = 1.3; l1a = 2.5; l2a = 1.2;

mu1 = inv(m1*l1*l1 + m2*(l1+l2)*(l1+l2)); mu2 = inv(m2*l2*l2);
mu1a = inv(m1a*l1a*l1a + m2a*(l1a+l2a)*(l1a+l2a)); mu2a = inv(m2a*l2a*l2a);

%Nominal Plant Parameters
A_n = blkdiag([0 1; 0 0], [0 1; 0 0]);
B_n = [0 0; mu1 0; 0 0; 0 mu2];
xic = zeros(4, 1);

%Reference Model Parameters
A_m = blkdiag([0 1; -2 -3], [0 1; -2 -3]);
B_m = [0 0; 1 0; 0 0; 0 1];
xmic = zeros(4, 1);

C = [1 0 0 0; 0 0 1 0];

%Discretization
sys = ss(A_n, B_n, C, 0);
sysD = c2d(sys, Ts);
F_n = sysD.A;
G_n = sysD.B;

%Discretization of Model
sys = ss(A_m, B_m, C, 0);
sysD = c2d(sys, Ts);
F_m = sysD.A;
G_m = sysD.B;

%Controller Parameters
K = place(F_n, G_n, eig(F_m));

%Observer parameters
L = (place(F_n', C', 0.1*eig(F_m)))';
xhatic = zeros(4, 1);
operric = C*(xic - xhatic);

T = 0.01;                           %Filter Time Constant
alpha = 1;                        %Parameter alpha

sim('DT_UDE_Alpha.slx');
graphAlpha