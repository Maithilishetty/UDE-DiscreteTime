close all
clear
clc

global tstep tstop Ts T A_n B_n Dis xic A B C Am Bm xmic Ad Bd TC Fdm Gdm

%Simulation Parameters
tstep = 0.001;
tstop = 10;

Ts = 0.01;              %Sampling Time
T = 0.1;                %Filter Time Constant

%Plant Parameters as known
A_n = [0 1; -2 3];
B_n = [0;2];
C_n = [1 0];
D_n = 0;
Dis = 10;
xic = [-3 2]';

%Actual Plant Parameters
A = [0 1;2 1];
B = [0;1];
C = [1 0];
D = 0;

%Model Parameters
Am = [0 1;-6 -2];
Bm = [0;4];
Cm = [1 0];
Dm = 0;
xmic = [1 1]';

%Discretizing Known Plant Parameters
sysD = c2d(ss(A_n, B_n, C_n, D_n), Ts);
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

%Discretizing Model Parameters
sysM = c2d(ss(Am, Bm, Cm, Dm), Ts);
Fm = sysM.A;
Gm = sysM.B;

Fdm = TC\Fm*TC;
Gdm = TC\Gm;

sim('UDE_CT.slx')
graphUDE