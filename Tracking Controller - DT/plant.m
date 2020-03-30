function op = plant(u)
    global a1 a2 b

    op = a1*u(2) + a2*u(3) + b*u(1);
end