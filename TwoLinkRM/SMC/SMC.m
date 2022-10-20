function out = SMC(u)
global K_D epsilon
D = [15 0; 0 10];
qe = [u(1); u(3)];
qe_dot = [u(2); u(4)];
s = qe_dot +  K_D*qe;
if norm(s) > epsilon
    out = D*s/norm(s);
else
    out = D*s/epsilon;
end
end
