function op = ud1(u)
    global Ts T G_n alpha L
    
    op = -(Ts/(alpha*T))*pinv(G_n)*L*u;
end