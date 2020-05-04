function op = sample(u)
    global Ts

    t = u(3);
    if mod(t, Ts) == 0
        op(1) = u(1);
        op(2) = u(2);
    else
        op(1) = 0;
        op(2) = 0;
    end
end