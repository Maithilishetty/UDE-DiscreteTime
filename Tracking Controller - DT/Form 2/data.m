close all
clear
clc

global tstep tstop Ts A B C D xic Ad Bd Cd

Ts = 0.01;
tstep = 0.001;
tstop = 0.8;

A = [0 1; 1.5 -0.9];
B = [0.2 0.9]';
C = [1 0];
D = 0;
xic = [-2 1]';

sysD = c2d(ss(A, B, C, D), Ts);
Ad = sysD.A;
Bd = sysD.B;
Cd = sysD.C;

sim('TCDT.slx');
graphTCDT