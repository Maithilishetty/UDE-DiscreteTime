close all
clear
clc

global a1 a2 b a1_n a2_n b_n Dis xic T K tstep tstop L xhat_ic

%Plant Parameters as Known
a1 = -0.5; 
a2 = 0.6;
b = 0.7;

%Actual Plant Parameters
a1_n = -0.8;
a2_n = 0.9;
b_n = 1;
Dis = 10;                       %Constant Disturbance

xic = [-2 1];                   %Initial States
T = 0.01;                       %Filter Time Constant
K = [0 0];                      %Error Dynamics: z^2 + K(1)z + K(2) = 0

Po = [0; 0];              %Desired Pole locations 
L = acker([0 1;a1 a2]', [1 0]', Po);
xhat_ic = [-1 -2];

%Simulation Parameters
tstep = 0.01;
tstop = 0.6;

sim('DT_UDE.slx')
graphUDE