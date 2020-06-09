function op = angle(u)
    global A_alpha B_alpha 
    states = [u(1);u(2)];
    op(1) = A_alpha(1,:)*states + B_alpha(1)*u(3);
    op(2) = A_alpha(2,:)*states + 500 + B_alpha(2)*u(3);     
end