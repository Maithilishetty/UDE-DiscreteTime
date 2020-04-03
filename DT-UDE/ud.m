function op = ud(u)
    global T tstep b
    
    t = u(2);
    ip2 = sin(2*pi*0.3*(t+tstep));
    op = (-tstep/T)*(u(1) - ip2)/b;
end