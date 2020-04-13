close all
clear
clc

global A B C D xic tstep tstop

A = [0 1; 1.5 -0.9];
B = [0.2 0.9]';
C = [1 0];
D = 0;
xic = [-2 1]';

tstep = 0.01;
tstop = 0.8;

sim('TCDT.slx');
graphTCDT