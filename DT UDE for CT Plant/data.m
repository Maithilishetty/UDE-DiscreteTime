close all
clear
clc

global tstep tstop Ts T A_n B_n Dis xic A B C F G TC Ad Bd Cd L x_hat_ic tracking_ic ua_ic

%Simulation Parameters
tstep = 0.001;
tstop = 25;

Ts = 0.01;              %Sampling Time
T = 10;                 %Filter Time Constant

%Actual Plant Parameters
A_n = [0 1; -2 3];
B_n = [0 2.5]';
C_n = [1 0];
D_n = 0;
Dis = 10;
xic = [-3 2]';

%Plant Parameters as Known
A = [0 1; -1 2];
B = [0 2]';
C = [1 0];
D = 0;

%Discretizing Known Plant Parameters
sysD = c2d(ss(A, B, C, D), Ts);
F = sysD.A;
G = sysD.B;

%Obtaining System in Controllable Canonical Form
CM = ctrb(F, G);
TA = compute(F);
TC = CM*TA;             %Transformation Matrix                
%Matrices in CCF
Ad = TC\F*TC;
Bd = TC\G;
Cd = C*TC;

%Observer Parameters
Po = [0; 0];
L = acker(F', C', Po)';
x_hat_ic = [-2; 1];

%Initial Conditions for Delays
p = C*G;
q = C*F;
refT = sin(0.3*2*pi*Ts);
tracking_ic = (1/p)*(refT - q*x_hat_ic);
ua_ic = -Ad(2, :)*TC*x_hat_ic;

sim('UDE.slx')
graphUDE