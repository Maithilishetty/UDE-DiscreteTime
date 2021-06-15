close all
clear
clc

global tstop tstep Ts d2r Vmic xic ldotic A_m B_m xmic Vt T udic

tstop = 3;
tstep = 0.005;
Ts = 0.01;

d2r = pi/180;

Vmic = 1000;
ric = 15000;
ttic = 20*d2r; ptic = 135*d2r;
tmic = 10*d2r; pmic = 10*d2r;

xic = [ric; -30*d2r; 45*d2r; tmic; pmic; ttic; ptic];
ldotic = [-0.001; 0.005];

%Reference Model Parameters
A_m = [-2 0; 0 -3];
B_m = [1; 2];
xmic = [0; 0];

Vt = 800;

T = Ts;
rhoic = Vt/Vmic;
rdotic = Vmic*(rhoic*cos(ttic)*cos(ptic) - cos(tmic)*cos(pmic)); 
Aic = [-2*rdotic/ric 0; 0 -2*rdotic/ric];
Bic = [1/ric 0; 1/ric -1/ric];
sys = ss(Aic, Bic, [1 0], 0);
sysD = c2d(sys, Ts);
Fic = sysD.A;
Gic = sysD.B;

udic = -(Ts/T)*pinv(Gic)*ldotic;

sim('DTmodel.slx')
graphDT