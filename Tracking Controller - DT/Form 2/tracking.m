function op = tracking(u)
    global Ad Bd C tstep
    
    t = u(3);
    states = [u(1) u(2)]';
    ref1 = sin(2*pi*0.3*(t+tstep));
    p = C*Bd;
    op = (1/p)*(ref1 - C*Ad*states);
end