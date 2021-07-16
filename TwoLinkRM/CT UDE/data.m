close all
clear
clc

global tstep tstop m1 m2 l1 l2 g m1a m2a l1a l2a mu1 mu2 mu1a mu2a A_n B_n xic A_m B_m xmic K Ae T eic

tstep = 0.001;
tstop = 10;

%System Parameters
m1 = 2; m2 = 1; l1 = 2; l2 = 1; g = 9.8;
m1a = 2.4; m2a = 1.3; l1a = 2.5; l2a = 1.2;

mu1 = inv(m1*l1*l1 + m2*(l1+l2)*(l1+l2)); mu2 = inv(m2*l2*l2);
mu1a = inv(m1a*l1a*l1a + m2a*(l1a+l2a)*(l1a+l2a)); mu2a = inv(m2a*l2a*l2a);

%Nominal Plant Parameters
A_n = blkdiag([0 1; 0 0], [0 1; 0 0]);
B_n = [0 0; mu1 0; 0 0; 0 mu2];
xic = zeros(4, 1);

%Reference Model Parameters
A_m = blkdiag([0 1; -2 -3], [0 1; -2 -3]);
B_m = [0 0; 1 0; 0 0; 0 1];
xmic = zeros(4, 1);

%Controller Parameters
K = place(A_n, B_n, eig(A_m));
Ae = A_n - B_n*K;

T = 0.01;           %Filter Time Constant
eic = xic - xmic;   %Error Initial Condition

sim('CT_UDE.slx');
graphCT