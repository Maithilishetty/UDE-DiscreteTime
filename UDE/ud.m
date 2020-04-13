function op = ud(u)
    global T Ts Bd
    
    t = u(3);
    if mod(t, Ts) == 0
        op = (-Ts/T)*(u(2) - u(4))/Bd(2);
    else
        op = 0;
    end
end