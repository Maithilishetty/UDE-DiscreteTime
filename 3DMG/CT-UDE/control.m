function op = control(u)
    global T Vt A_m
    
    u1 = [u(1); u(2)];
    u2 = [u(3); u(4)];
    r = u(5); rdot = u(12);
    
    A = [-2*rdot/r 0; 0 -2*rdot/r];
    B = [1/r 0; 1/r -1/r];
    PB = pinv(B);
    K = place(A, B, eig(A_m));
    Ae = (A - B*K);
    
    op(3) = -(1/T)*PB(1, :)*(u1 - Ae*u2);
    op(4) = -(1/T)*PB(2, :)*(u1 - Ae*u2);
    
    op(1) = -K(1, :)*u1 + op(3);
    op(2) = -K(2, :)*u1 + op(4);
    op(5) = rdot;
end