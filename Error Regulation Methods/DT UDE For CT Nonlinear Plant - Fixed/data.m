close all 
clear
clc

global A_n B_n A B A_m B_m b1 mu2 b2 xic xmic K Fe Ts T F_n G_n tstep tstop

tstep = 0.001;
tstop = 10;
Ts = 0.01;

%Taking the angle of attack to be constant, alpha = 21.5
%Parameter values taken from 'Extended state observer based robust control
%of wing rock motion' paper
a = [-0.04207; 0.01456; 0.04714;-0.18583; 0.24234];
c1 = 0.354;
a1 = -c1*a(1);
c2 = 0.001;
a2 = c1*a(2) - c2;
g = 1.5;
b1 = c1*a(3);
mu2 = c1*a(4);
b2 = c1*a(5);

%Nominal Plant Paramaters
A_n = [0 1;a1 a2];
B_n = [0;g];

%Actual Plant Paramaters  and disturbance
A = [0 1; a1+0.6 a2+1.5];
B = [0; g+0.5];
xic = [20; 0];

%Reference Model 
A_m = [0 1; -6 -5];
B_m = [0; 1];
xmic = [10; 0];

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

%Controller Parameters
K = place(F_n, G_n, eig(F_m));
Fe = F_n - G_n*K;

T = 0.01;                           %Filter Time Constant
eic = xic - xmic;                   %Error Initial Condition
udic = (-Ts/T)*pinv(G_n)*eic;       %Initial Condition for Robust Control

sim('UDE_nonlinear_fixed.slx');
graphUDE_nonlinear