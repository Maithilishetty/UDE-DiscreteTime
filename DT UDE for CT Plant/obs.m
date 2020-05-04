function op = obs(u)
    global A B L
    op(1) = A(1, 1)*u(1) + A(1, 2)*u(2) + B(1)*u(3) + L(1)*u(5);
    op(2) = A(2, 1)*u(1) + A(2, 2)*u(2) + B(2)*u(3) - u(4) + L(2)*u(5);
end