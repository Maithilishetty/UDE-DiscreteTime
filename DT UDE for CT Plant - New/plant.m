function op = plant(u)
    global A B Dis
    op = A(2,1)*u(1) + A(2,2)*u(2) + B(2)*u(3) + Dis;
end
