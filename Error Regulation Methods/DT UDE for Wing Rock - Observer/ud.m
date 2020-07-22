function op = ud(u)
    global Ts T G_n Fe
    u1 = [u(1); u(2)];
    u2 = [u(3); u(4)];
    t = u(5);
    if mod(t, Ts) == 0
        op = (-Ts/T)*pinv(G_n)*(u1 - Fe*u2);
    else
        op = 0;
    end
end