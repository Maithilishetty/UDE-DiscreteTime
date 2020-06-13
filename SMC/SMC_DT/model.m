function op = model(u)
    global F_m G_m
    t = u(3);
    ref = sin(2*pi*0.3*t);
    states = [u(1);u(2)];
    op(1) = F_m(1,:)*states + G_m(1)*ref;
    op(2) = F_m(2,:)*states + G_m(2)*ref;
end
