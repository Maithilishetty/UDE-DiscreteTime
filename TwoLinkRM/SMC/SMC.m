function out = SMC(u)
global K_D
D = [100 0; 0 300];
qe = [u(1); u(3)];
qe_dot = [u(2); u(4)];
s = qe_dot +  K_D*qe;
out = D*sign(s);
end
