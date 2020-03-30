close all
clear
clc

global a1 a2 K b tstep tstop
a1 = 0.8; 
a2 = -0.4;
b = 1;
K = [-0.5 0.5];
xic = [-1 1];

tstep = 0.01;
tstop = 0.5;

sim('TCDT.slx')
graphTCDT