function op = plant(u)
    global A B 
    states = [u(1);u(2)];
    t = u(4);
    %d = 0.5*u(1) + 0.53*u(2) + 0.2*u(3) + 0.1;
    d1 = 0.01*sin(t*u(1)*u(1));
    op(1) = A(1,:)*states + B(1)*u(3);
    op(2) = A(2,:)*states + B(2)*u(3) + d1;
end
