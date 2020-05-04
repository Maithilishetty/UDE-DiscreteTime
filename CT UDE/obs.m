function op5 = obs(u)
global a1_n a2_n b_n L

op5(1) = u(2) + L(1)*u(5);
op5(2) = a1_n*u(1) + a2_n*u(2) + b_n*u(3) - u(4) + L(2)*u(5);
end