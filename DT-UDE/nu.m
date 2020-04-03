function op = nu(u)
    global tstep a1 a2 b
    
    t = u(3);
    ref2 = sin(2*pi*0.3*(t+2*tstep));
    op = (-a1*u(1) - a2*u(2) + ref2)/b;
end