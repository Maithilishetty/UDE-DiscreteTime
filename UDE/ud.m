function op = ud(u)
    global T Ts Bd
    
    t = u(3);
    if mod(t, Ts) == 0
        ip2 = sin(0.3*2*pi*(t+Ts));
        op = (-Ts/T)*(u(2) - ip2)/Bd(2);
    else
        op = 0;
    end
end