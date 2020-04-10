function op = nu(u)
    global Ts Ad Bd K
    
    t = u(3);
    if mod(t, Ts) == 0
        ref = sin(0.3*2*pi*t);
        ref1 = sin(0.3*2*pi*(t+Ts));
        ref2 = sin(0.3*2*pi*(t+2*Ts));
        ua = -Ad(2, 1)*u(1) - Ad(2, 2)*u(2);
        nu = ref2 + K(1)*(ref1 - u(2)) + K(2)*(ref - u(1));
        op = (ua + nu)/Bd(2);
    else
        op = 0;
    end
end