function op = plant(u)
    global A B b1 mu2 b2
    states = [u(1); u(2)];
    op(1) = A(1, :)*states + B(1)*u(3);
    op(2) = A(2, :)*states + B(2)*u(3) + ((b1+0.01)*u(2)^3 + (mu2-0.1)*(u(1)^2)*u(2) + (b2-0.2)*u(1)*(u(2)^2)) + 2;
end