function out = PD_control(u)
global K_P K_D m1a m2a l1a l2a g

e = [u(1); u(3)];
e_dot = [u(2); u(4)];
x1 = u(5);
x3 = u(7);
K_theta = [(m1a+m2a)*g*l1a*sin(x1)+m2a*g*l2a*sin(x1+x3); m2a*g*l2a*sin(x1+x3)];
out = K_P*e + K_D*e_dot + K_theta;
end
