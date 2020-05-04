function op1 = plant(u)
global a1 a2 b Dis

op1 = a1*u(1) + a2*u(2) + b*u(3) + Dis;
end
