function op3 = nu(u)
global K

t = u(3);
xref = 10*sin(t);
xrefdot = 10*cos(t);
xref2dot = -10*sin(t);

op3 = xref2dot + K(1)*(xrefdot - u(2)) + K(2)*(xref - u(1));
end