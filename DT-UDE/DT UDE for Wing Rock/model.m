function op = model(u)
    global A_m B_m
    states = [u(1); u(2)];
    t = u(3);
    ref = 3*sin(2*pi*0.3*t);
    op(1) = A_m(1, :)*states + B_m(1)*ref;
    op(2) = A_m(2, :)*states + B_m(2)*ref;
end