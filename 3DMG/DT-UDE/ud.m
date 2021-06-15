function op = ud(u)
    global Ts T Vt A_m B_m
    
    u1 = [u(1); u(2)];
    u2 = [u(3); u(4)];
    r = u(5); rdot = u(12); t = u(19);
    op(3) = rdot;
    
    if mod(t, Ts) == 0
        A = [-2*rdot/r 0; 0 -2*rdot/r];
        B = [1/r 0; 1/r -1/r];
        sys = ss(A, B, [1 0], 0);
        sysD = c2d(sys, Ts);
        F = sysD.A;
        G = sysD.B;
        sysm = ss(A_m, B_m, [1 0], 0);
        sysDm = c2d(sysm, Ts);
        F_m = sysDm.A;
        G_m = sysDm.B;
        K = place(F, G, eig(F_m));
        Fe = F - G*K;
        PG = pinv(G);
        op(1) = -(Ts/T)*PG(1, :)*(u1 - Fe*u2);
        op(2) = -(Ts/T)*PG(2, :)*(u1 - Fe*u2);
    else
        op(1) = 0; 
        op(2) = 0;
    end
end