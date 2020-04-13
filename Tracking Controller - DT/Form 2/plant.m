function op = plant(u)
    global A B xic
    
    t = u(4);
    if t == 0
        states = xic;
    else
        states = [u(1) u(2)]';
    end
    op = A*states + B*u(3);
end