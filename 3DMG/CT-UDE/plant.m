function op = plant(u)
    global Vt
    
    r = u(1);
    ly = u(2); lz = u(3); tm = u(4);
    pm = u(5); tt = u(6); pt = u(7);
    Vm = u(8); Ayt = u(9); Azt = u(10);
    Azm = u(11); Aym = u(12);
    rdot = u(13);
    lydot = u(14); lzdot = u(15);
    
    rho = Vt/Vm;
    p = (rho*cos(tt)*sin(pt) - cos(tm)*sin(pm));
    
    d1 = (1/r)*(Azm*(cos(tm)-1) - Azt*cos(tt) + Vm*Vm*cos(tm)*tan(ly)*sin(pm)*(p/r)-rho*Vm*Vm*cos(tt)*sin(pt)*tan(ly)*(p/r));
    d21 = (1/r)*(Ayt*cos(tt) - rho*Vm*Vm*sin(tt)*tan(ly)*(p/r)-Azt*sin(tt)*sin(pt) + Aym*(1-cos(tm)) + Azm*(sin(tm)*sin(pm)-1));
    d22 = (1/r)*(Vm*Vm*sin(tm)*tan(ly)*(p/r));
    d2 = d21 + d22;
    
    op(1) = -2*rdot*lydot/r + Azm/r + d1;
    op(2) = -2*rdot*lzdot/r - Aym/r + Azm/r + d2;
end