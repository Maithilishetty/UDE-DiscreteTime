function op = tracking(u)
    global A1 B1 C1 Ts
    
    t = u(3);
    if mod(t, Ts) == 0
        ref1 = sin(0.3*2*pi*(t+Ts));
        p = C1*B1;
        q = C1*A1;
        op = (1/p)*(ref1 - q*([u(1) u(2)]'));
    else
        op = 0;
    end
end