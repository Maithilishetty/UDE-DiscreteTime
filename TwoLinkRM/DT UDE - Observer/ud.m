function op = ud(u)
    global Ts T G_n L
    
    op = (-Ts/T)*pinv(G_n)*L*u;
end