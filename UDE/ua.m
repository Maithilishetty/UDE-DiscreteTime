function op = ua(u)
    global Ts Ad Bd
    t = u(3);
    if mod(t, Ts) == 0
        op = (-Ad(2,1)*u(1) - Ad(2,2)*u(2))/(Bd(2));
    else
        op = 0;
    end
end