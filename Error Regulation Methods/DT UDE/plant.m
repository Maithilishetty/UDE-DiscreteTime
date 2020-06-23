function op = plant(u)
    global F G
    states = [u(1); u(2)];
    t = u(4);
    op(1) = F(1, :)*states + G(1)*u(3);
    op(2) = F(2, :)*states + G(2)*u(3) + 5*sin(0.01*t*u(1)*u(1));
end