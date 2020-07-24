function op = plant(u)
    global A B
    states = [u(1); u(2)];
    t = u(4);
    op(1) = A(1, :)*states + B(1)*u(3);
    op(2) = A(2, :)*states + B(2)*u(3) + 2*(sin(t)*(u(1))^2 + cos(t)*u(2) + 1);
end