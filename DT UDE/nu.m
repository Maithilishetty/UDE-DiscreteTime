function op = nu(u)
    global tstep a1 a2 K
    
    t = u(3);
    ref = sin(0.3*2*pi*t);
    ref1 = sin(0.3*2*pi*(t+tstep));
    ref2 = sin(0.3*2*pi*(t+2*tstep));
    ua = -a1*u(1) - a2*u(2);
    nu = ref2 + K(1)*(ref1 - u(2)) + K(2)*(ref - u(1));
    op = (ua + nu);
end