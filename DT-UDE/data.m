close all
clear
clc

global a1 a2 b a1_n a2_n b_n Dis xic T tstep tstop

%Plant Parameters as Known
a1 = 0.8; 
a2 = 0.4;
b = 1;

%Actual Plant Parameters
a1_n = 0.5;
a2_n = 0.6;
b_n = 1;
Dis = 5;              %Constant Disturbance

xic = [-2 1];         %Initial States
T = 0.1;              %Filter Time Constant

%Simulation Parameters
tstep = 0.01;
tstop = 0.8;

sim('DT_UDE.slx')
graphUDE