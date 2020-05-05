function op = obs(u)
    global F G L Ts
    t = u(5);
    if mod(t, Ts) == 0
        op(1) = F(1, 1)*u(1) + F(1, 2)*u(2) + G(1)*u(3) + L(1)*u(6);
        op(2) = F(2, 1)*u(1) + F(2, 2)*u(2) + G(2)*u(3) - u(4) + L(2)*u(6);
    else
        op(1) = 0;
        op(2) = 0;
    end
end