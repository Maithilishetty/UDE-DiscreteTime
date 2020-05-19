function op = ud(u)
    global Ts T Bd TC
    t = u(3);
    if mod(t, Ts) == 0
        G_inv = (1\(Bd'*Bd))*Bd';
        xm = TC\[u(1);u(2)];
        x = TC\[u(4);u(5)];
        error = x - xm;
        op = -G_inv*((Ts/T)*error);
    else
        op = 0;
    end
    
