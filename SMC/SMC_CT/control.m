function op = control(u)
    global G F_n G_n F_m G_m Ts 
    t = u(8);
    if mod(t, Ts) == 0
        delayed_control = u(5);   
        ref = sin(2*pi*0.3*t);
        states = [u(1);u(2)];
        delayed_states = [u(3);u(4)];
        reference = [u(6);u(7)];
        error = states - reference;        
        s = G.*error;
        op = delayed_control + pinv(G.*G_n)*(-G.*F_n*(states - delayed_states) + G.*((F_m*reference + G_m*ref) - reference - s));
    else
        op = 0;
    end
end
