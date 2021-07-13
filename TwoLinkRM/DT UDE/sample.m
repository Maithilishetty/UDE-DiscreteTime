function op = sample(u)
    global Ts
    t = u(5);
    if mod(t, Ts) == 0
        op(1) = u(1);
        op(2) = u(2);
        op(3) = u(3);
        op(4) = u(4);
    else
        op(1) = 0;
        op(2) = 0;
        op(3) = 0;
        op(4) = 0;
    end
    
end