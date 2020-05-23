function op = plant(u)
    global A B
    t = u(4);
    op = A(2,1)*u(1) + A(2,2)*u(2) + B(2)*u(3) + t*sin(u(1))*sin(u(2));
end
