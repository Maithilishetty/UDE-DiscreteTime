function op = ud(u)
    global T tstep Fe
    e = Fe*[u(3); u(4)];
    op = -(tstep/T)*(u(2) - e(2));
end
