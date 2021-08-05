function op = ud2(u)
    global alpha G_n L
    
    op = -((1-alpha)/alpha)*pinv(G_n)*L*u;
end