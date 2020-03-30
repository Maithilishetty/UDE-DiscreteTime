function op = control(u)
    global a1 a2 K1 K2 b tstep
    t = u(1);
    ua = -a1*u(2) - a2*u(3);
    ref = sin(2*pi*0.3*t);
    ref1 = sin(2*pi*0.3*(t+tstep));
    ref2 = sin(2*pi*0.3*(t+2*tstep));
    nu = ref2 + K1*(ref1 - u(3)) + K2*(ref - u(2));
    op = (ua + nu)/b;
end