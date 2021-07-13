function op = plant(u)
    global m1 m2 l1 l2 g mu1 mu2
    x1 = u(1); x2 = u(2); x3 = u(3); x4 = u(4);
    u1 = u(5); u2 = u(6); t = u(7);
    
    M = [m1*l1*l1 + m2*(l1*l1+l2*l2+2*l1*l2*cos(x3)) m2*(l2*l2+l1*l2*cos(x3)); m2*(l2*l2+l1*l2*cos(x3)) m2*l2*l2];
    C = [-m2*l1*l2*sin(x3)*x4*(2*x2+x4); m2*l1*l2*x2*x2*sin(x3)];
    K = [(m1+m2)*g*l1*sin(x1)+m2*g*l2*sin(x1+x3); m2*g*l2*sin(x1+x3)];
    
    Mo = diag([inv(mu1); inv(mu2)]);
    D = -inv(M)*(C+K) + (inv(M) - inv(Mo))*[u1; u2];
    
    op(1) = x2;
    op(2) = D(1) + mu1*u1;
    op(3) = x4;
    op(4) = D(2) + mu2*u2;
end