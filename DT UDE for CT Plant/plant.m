function op = plant(u)
    global A_n B_n Dis

    op = A_n(2, 1)*u(1) + A_n(2, 2)*u(2) + B_n(2)*u(3) + Dis;
end