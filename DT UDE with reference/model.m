function op = model(u)
    global Am Bm 
    x1m = u(1);
    x2m = u(2);
    time = u(3);
    ref = sin(0.3*2*pi*time);
    op = Am(2,1)*x1m + Am(2,2)*x2m + Bm(2)*ref;
end
