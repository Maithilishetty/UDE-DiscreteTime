close all
clear
clc

global Ts A_n B_n Dis xic Ad Bd K T tstep tstop

Ts = 0.01;              %Sampling Time

%Actual Plant Parameters
A_n = [0 1; -2 3];
B_n = [0 2]';
C_n = [1 0];
D_n = 0;
Dis = 10;
xic = [-1 2]';

%Plant Parameters as Known
A = [0 1; -3 2];
B = [0 1]';
C = [1 0];
D = 0;

sysD = c2d(ss(A, B, C, D), Ts);     %Discretized Version     

%Discretized Parameters as Known
Ad = sysD.A;
Bd = sysD.B;

K = [0 0];              %Error Dynamics: z^2 + K(1)z + K(2) = 0
T = 0.1;                %Filter Time Constant

%Simulation Parameters
tstep = 0.001;
tstop = 20;

sim('UDE.slx')
graphUDE