function op = ud(u)
    global Ts T G_n Fe
    u1 = [u(1); u(2); u(3); u(4)];
    u2 = [u(5); u(6); u(7); u(8)];
    t = u(9);
    if mod(t, Ts) == 0
        op = (-Ts/T)*pinv(G_n)*(u1 - Fe*u2);
    else
        op(1) = 0; op(2) = 0;
    end
end