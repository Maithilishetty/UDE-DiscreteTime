function op = ud(u)
    global T B_n Ae
    u1 = [u(1); u(2)];
    u2 = [u(3); u(4)];
    op = (-1/T)*pinv(B_n)*(u1 - Ae*u2);
end