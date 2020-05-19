function op = model(u)
    global Am Bm 
    time = u(3);
    ref = sin(0.3*2*pi*time);
    op = Am(2,1)*u(1) + Am(2,2)*u(2) + Bm(2)*ref;
end