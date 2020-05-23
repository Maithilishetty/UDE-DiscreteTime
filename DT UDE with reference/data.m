close all
clear
clc

global A_n B_n C_n A B C Am Bm Dis xic xmic T tstep tstop eic udic Fe

%Plant Parameters as Known
A_n = [0 1;-1 0.6];
B_n = [0;1.8];
C_n = [0 1];

%Actual Plant Parameters
A = [0 1;-0.8 0.5];
B = [0;1.5];
C = [0 1];
Dis = 10;              %Constant Disturbance

%Model Paramaters
Am = [0 1;0.4 0.5];
Bm = [0;1];

Fe = [0.6 0; 0 -0.6];

xic = [-2 -1];          %Initial States
xmic = [1 1];
eic = xic - xmic;
T = 0.01;              %Filter Time Constant
udic = (-tstep/T)*(xic(2) - xmic(2));

%Simulation Parameters
tstep = 0.01;
tstop = 0.5;

sim('DT_UDE_Reference.slx')
graphUDE