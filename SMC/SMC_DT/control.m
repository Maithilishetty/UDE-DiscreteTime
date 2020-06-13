function op = control(u)
    global G B_n A_n F_m G_m
    delayed_control = u(5);
    t = u(8);
    ref = sin(2*pi*0.3*t);
    states = [u(1);u(2)];
    delayed_states = [u(3);u(4)];
    reference = [u(6);u(7)];
    error = states - reference;        
    s = G.*error;
    op = delayed_control + pinv(G.*B_n)*(-G.*A_n*(states - delayed_states) + G.*((F_m*reference + G_m*ref) - reference - s));
end
