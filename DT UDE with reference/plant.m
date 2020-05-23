function op = plant(u)
    global A B
    x1 = u(1);
    x2 = u(2);
    control = u(3);
    t = u(4);
    op = A(2,1)*x1 + A(2,2)*x2 + B(2)*control + 2*sin(t)*cos(t) + 0.01*x1*x2;
end

    