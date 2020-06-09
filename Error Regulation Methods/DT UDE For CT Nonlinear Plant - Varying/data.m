close all 
clear
clc

global A_n B_n A B A_m B_m a c1 c2 xic xmic K Fe Ts T F_n G_n tstep tstop A_alpha B_alpha alphaic

tstep = 0.001;
tstop = 10;
Ts = 0.01;

%Taking the nominal values to be at an angle of attack, alpha = 21.5
%Parameter values taken from 'Extended state observer based robust control
%of wing rock motion' paper
a = [-0.01026 -0.02117 -0.14181 0.99735 -0.83478;
    -0.02007 -0.0102 -0.0837 0.63333 -0.5034;
    -0.0298 0.000818 -0.0255 0.2692 -0.1719;
    -0.04207 0.01456 0.04714 -0.18583 0.24234;
    -0.04681 0.01966 0.05671 -0.22691 0.59065;
    -0.0518 0.0261 0.065 -0.2933 1.0294;
    -0.05686 0.03254 0.07334 -0.3597 1.4681];
c1 = 0.354;
a1 = -c1*-0.04207;      %Nominal value of a1 at 21.5 
c2 = 0.001;
a2 = c1*0.01456 - c2;   %Nominal value of a2 at 21.5 
g = 1.5;

%Time Varying angle-of-attack parameters
A_alpha = [0 25;-25 -10];
B_alpha = [0; 62.5];
alphaic = [20; 0];

%Nominal Plant Paramaters
A_n = [0 1;a1 a2];
B_n = [0 ;g];

%Actual Plant Paramaters  and disturbance
A = [0 1; a1 a2];
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

sim('UDE_nonlinear.slx');
%graphUDE_nonlinear