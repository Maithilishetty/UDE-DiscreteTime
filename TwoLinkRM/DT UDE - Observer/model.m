function op = model(u)
    global A_m B_m
    states = [u(1); u(2); u(3); u(4)];
    t = u(5);
    ref = [5*sin(t); 5*sin(2*t)];
    
    op = A_m*states + B_m*ref;
end