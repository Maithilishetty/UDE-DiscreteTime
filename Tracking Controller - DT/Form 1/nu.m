function op = nu(u)
    global K b tstep
    
    t = u(1);
    ref = sin(2*pi*0.3*t);
    ref1 = sin(2*pi*0.3*(t+tstep));
    ref2 = sin(2*pi*0.3*(t+2*tstep));
    op = (ref2 + K(1)*(ref1 - u(3)) + K(2)*(ref - u(2)))/b;
end