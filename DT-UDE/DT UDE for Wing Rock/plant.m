function op = plant(u)
    global A B
    states = [u(1); u(2)];
    t = u(4);
    op(1) = A(1, :)*states + B(1)*u(3);
    op(2) = A(2, :)*states + B(2)*u(3) + 5*sin(15*t) + 3*cos(5*t)*abs(u(1))*u(2) + 10*sin(10*t)*abs(u(2))*u(2);
end