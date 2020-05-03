function op = control(u)
    global Ad Bd Cd Ts
    
    t = u(3);
    states = [u(1) u(2)]';
    ref1 = sin(2*pi*3*(t+Ts));
    p = Cd*Bd;
    op = (1/p)*(ref1 - Cd*Ad*states);
end