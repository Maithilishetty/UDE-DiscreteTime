close all
clear
clc

global Ts A_n B_n Dis xic Ad Bd Cd T tstep tstop A1 B1 C1

Ts = 0.01;              %Sampling Time

%Actual Plant Parameters
A_n = [0 1; -2 3];
B_n = [0 2]';
C_n = [1 0];
D_n = 0;
Dis = 10;
xic = [-3 2]';

%Plant Parameters as Known
A = [0 1; 0 1];
B = [0 2]';
C = [1 0];
D = 0;

sysD = c2d(ss(A, B, C, D), Ts);     %Discretized Version 
A1 = sysD.A;
B1 = sysD.B;
C1 = sysD.C;
CM = ctrb(A1, B1);
TA = compute(A1);
TC = CM*TA;                         %Transformation Matrix

%System in Controllable Canonical Form
Ad = TC\A1*TC;
Bd = TC\B1;
Cd = C1*TC;

T = 0.1;               %Filter Time Constant

%Simulation Parameters
tstep = 0.001;
tstop = 10;

sim('UDE.slx')
graphUDE