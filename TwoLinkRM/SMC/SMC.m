function out = SMC(u)
global K_D epsilon
global m1 m2 l1 l2 g

x1 = u(5); x2 = u(6); x3 = u(7); x4 = u(8);

M = [m1*l1*l1 + m2*(l1*l1+l2*l2+2*l1*l2*cos(x3)) m2*(l2*l2+l1*l2*cos(x3)); m2*(l2*l2+l1*l2*cos(x3)) m2*l2*l2];
C = [-m2*l1*l2*sin(x3)*x4*(2*x2+x4); m2*l1*l2*x2*x2*sin(x3)];
K = [(m1+m2)*g*l1*sin(x1)+m2*g*l2*sin(x1+x3); m2*g*l2*sin(x1+x3)];

theta_m_ddot = [u(2); u(4)]; 

D = [15 0; 0 10];
qe = [u(9); u(11)];
qe_dot = [u(10); u(12)];
s = qe_dot +  K_D*qe;
if norm(s) > epsilon
    t_d = D*s/norm(s);
else
    t_d = D*s/epsilon;
end

out = t_d + M*theta_m_ddot + C + K; 
end
