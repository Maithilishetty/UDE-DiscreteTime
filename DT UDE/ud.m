function op = ud(u)
    global T tstep b
    
    t = u(2);
    ip2 = sin(0.3*2*pi*(t+tstep));
    op = (-tstep/T)*(u(1) - ip2);
end