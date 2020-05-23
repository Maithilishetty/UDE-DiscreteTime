function op = ud(u)
    global Ts T Bd TC Fe
    t = u(3);
    if mod(t, Ts) == 0
        G_inv = (1\(Bd'*Bd))*Bd';
        e = TC\[u(1);u(2)];
        ed = Fe*(TC\[u(4);u(5)]);
        error = e - ed;
        op = -G_inv*((Ts/T)*error);
    else
        op = 0;
    end
    
