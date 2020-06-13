function op = model(u)
    global A_m B_m
    t = u(3);
    ref = sin(2*pi*0.3*t);
    states = [u(1);u(2)];
    op(1) = A_m(1,:)*states + B_m(1)*ref;
    op(2) = A_m(2,:)*states + B_m(2)*ref;
end
