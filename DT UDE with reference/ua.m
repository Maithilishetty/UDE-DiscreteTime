function op = ua(u)
    global A_n Am Bm
    x1m = u(1);
    x2m = u(2);
    time = u(3);
    x1 = u(4);
    x2 = u(5);
    ref = sin(0.3*2*pi*time);
    op = Am(2,1)*x1m + Am(2,2)*x2m + Bm(2)*ref - A_n(2,1)*x1 - A_n(2,2)*x2;
end
    