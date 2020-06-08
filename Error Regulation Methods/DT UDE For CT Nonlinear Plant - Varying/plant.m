function op = plant(u)
    global A B c1 dis a c2
    states = [u(1); u(2)];
    alpha = [15; 17; 19; 21.5; 22.5; 23.75; 25]; %Different alpha values 
    spread = [1.5; 1.5; 1.5; 2.0; 1; 1; 1];      %Different spread values
    den = 0;
    dis = 0;
    %Interpolation calculation
    for l = 1:7
        den = den + exp(-((u(4)-alpha(l))/spread(l))^2);
    end
    for i = 1:7
        dis = dis + (exp(-((u(4)-alpha(i))/spread(i))^2)/den)*(-c1*a(i,1)*u(1) + (c1*a(i,2) - c2)*u(2) + c1*a(i,3)*u(2)^3 + c1*a(i,4)*(u(1)^2)*u(2) + c1*a(i,5)*u(1)*(u(2)^2));
    end
    d_external = 0.6141*u(1) + 1.2099*u(2) - 0.0513*u(1)^2*u(2) + 0.035*u(1)*u(2)^2 + 0.0135*u(2)^3;
    op(1) = A(1, :)*states + B(1)*u(3);
    op(2) = A(2, :)*states + B(2)*u(3) + dis + d_external;
end