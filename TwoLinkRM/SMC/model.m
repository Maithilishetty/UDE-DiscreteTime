function op = model(u)
    global A_m B_m
    states = [u(1); u(2); u(3); u(4)];
    t = u(5);
    ref = [5*sin(t); 5*sin(2*t)];
    op(1) = A_m(1, :)*states + B_m(1, :)*ref;
    op(2) = A_m(2, :)*states + B_m(2, :)*ref;
    op(3) = A_m(3, :)*states + B_m(3, :)*ref;
    op(4) = A_m(4, :)*states + B_m(4, :)*ref;
end