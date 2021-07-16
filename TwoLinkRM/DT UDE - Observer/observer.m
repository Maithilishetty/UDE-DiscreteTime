function op = observer(u)
    global F_n G_n F_m G_m L
    
    states = [u(1); u(2); u(3); u(4)];
    operr = [u(5); u(6)]; ud = [u(7); u(8)];
    input = [u(9); u(10)];
    refstates = [u(11); u(12); u(13); u(14)]; t = u(15);
    Ld = -G_n*ud;
    ref = [5*sin(t); 5*sin(2*t)];
    D = Ld - (F_n - F_m)*refstates - G_m*ref;
    
    op = F_n*states + G_n*input + D + L*operr;
end