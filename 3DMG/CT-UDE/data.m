% close all
clear
clc

global tstop tstep d2r Vmic xic ldotic A_m B_m xmic Vt T

tstop = 3;
tstep = 0.005;

d2r = pi/180;

Vmic = 1000;

xic = [15000; -30*d2r; 45*d2r; 10*d2r; 10*d2r; 20*d2r; 135*d2r];
ldotic = [-0.001; 0.005];

%Reference Model Parameters
A_m = [-2 0; 0 -3];
B_m = [1; 2];
xmic = [0; 0];

Vt = 800;

T = 0.01;

sim('CTModel.slx')
graphCT