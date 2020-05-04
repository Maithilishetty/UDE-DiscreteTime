function op5 = obs(u)
    global a1 a2 b L
    x1_hat = u(1);
    x2_hat = u(2);
    control = u(3);
    op5(1) = x2_hat + L(1)*u(4);
    op5(2) = a1*x1_hat + a2*x2_hat + b*control + L(2)*u(4) - u(5);
end