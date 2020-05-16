function op = plant(u)
    global A B Dis
    x1 = u(1);
    x2 = u(2);
    control = u(3);
    op = A(2,1)*x1 + A(2,2)*x2 + B(2)*control + Dis;
end

    