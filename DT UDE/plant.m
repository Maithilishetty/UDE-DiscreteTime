function op = plant(u)
    global a1_n a2_n b_n Dis

    op = a1_n*u(2) + a2_n*u(3) + b_n*u(1) + Dis;
end