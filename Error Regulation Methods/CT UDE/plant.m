function op = plant(u)
    global A B
    states = [u(1); u(2)];
    t = u(4);
    op(1) = A(1, :)*states + B(1)*u(3) + (u(1))^2;
    op(2) = A(2, :)*states + B(2)*u(3) + t*sin(u(1))*sin(u(2));
end