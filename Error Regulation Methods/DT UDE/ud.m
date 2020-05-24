function op = ud(u)
    global tstep T G_n Fe
    u1 = [u(1); u(2)];
    u2 = [u(3); u(4)];
    op = (-tstep/T)*pinv(G_n)*(u1 - Fe*u2);
end