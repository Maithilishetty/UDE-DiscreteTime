function op = ua(u)
    global Ad Ts TC
    t = u(3);
    if mod(t, Ts) == 0
        op = -Ad(2, :)*TC*[u(1); u(2)];
    else
        op = 0;
    end
end