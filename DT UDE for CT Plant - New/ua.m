function op = ua(u)
    global Ad Bd Fdm Gdm Ts TC Fe
    t = u(3);
    if mod(t, Ts) == 0
        ref = sin(0.3*2*pi*t);
        G_inv = (1\(Bd'*Bd))*Bd';
        xm = TC\[u(1);u(2)];
        x = TC\[u(4);u(5)];
        e = x-xm;
        op = G_inv*(Fe*e + Fdm*xm + Gdm*ref - Ad*x);
    else
        op = 0;
    end
end
    
