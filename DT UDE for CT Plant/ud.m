function op = ud(u)
    global T Ts Bd TC
    
    t = u(3);
    x = TC*[u(1); u(2)];
    if mod(t, Ts) == 0
        op = (-Ts/T)*(x(2) - u(4) + u(5))/Bd(2);
    else
        op = 0;
    end
end