function op = obs(u)
    global F_n G_n F_m G_m L Ts 
    states = [u(1); u(2)];
    t = u(4);
    err = u(5);
    Ld = -G_n*u(6);
    reference_states = [u(7); u(8)];
    ref = 5*sin(2*pi*0.3*t);
    Dis = Ld - (F_n - F_m)*reference_states + G_m*ref;
    if mod(t, Ts) == 0
        op = F_n*states + G_n*u(3) + L*err + Dis;
    else
        op = [0;0];
    end
end
