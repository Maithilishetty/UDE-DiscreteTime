function op = plant(u)
    global F G
    states = [u(1); u(2)];
    t = u(4);
    op(1) = F(1, :)*states + G(1)*u(3) + (u(1))^2;
    op(2) = F(2, :)*states + G(2)*u(3) + t*sin(u(1))*sin(u(2));
end