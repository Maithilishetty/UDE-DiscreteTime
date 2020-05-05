function op = sample(u)
    global Ts

    t = u(2);
    if mod(t, Ts) == 0
        op = u(1);
    else
        op = 0;
    end
end