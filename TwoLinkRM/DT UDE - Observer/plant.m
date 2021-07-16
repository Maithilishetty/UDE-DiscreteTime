function op = plant(u)
    global m1a m2a l1a l2a g mu1a mu2a
    x1 = u(1); x2 = u(2); x3 = u(3); x4 = u(4);
    u1 = u(5); u2 = u(6);
    
    M = [m1a*l1a*l1a + m2a*(l1a*l1a+l2a*l2a+2*l1a*l2a*cos(x3)) m2a*(l2a*l2a+l1a*l2a*cos(x3)); m2a*(l2a*l2a+l1a*l2a*cos(x3)) m2a*l2a*l2a];
    C = [-m2a*l1a*l2a*sin(x3)*x4*(2*x2+x4); m2a*l1a*l2a*x2*x2*sin(x3)];
    K = [(m1a+m2a)*g*l1a*sin(x1)+m2a*g*l2a*sin(x1+x3); m2a*g*l2a*sin(x1+x3)];
    
    Mo = diag([inv(mu1a); inv(mu2a)]);
    D = -inv(M)*(C+K) + (inv(M) - inv(Mo))*[u1; u2];
    
    op = [x2; D(1)+mu1a*u1; x4; D(2)+mu2a*u2];
end