function op = usystem(u)
    global Vt

    r = u(1);
    ly = u(2); lz = u(3); tm = u(4);
    pm = u(5); tt = u(6); pt = u(7);
    Vm = u(8); Ayt = u(9); Azt = u(10);
    Azm = u(11); Aym = u(12);
    rho = Vt/Vm;
    
    op(1) = Vm*(rho*cos(tt)*cos(pt) - cos(tm)*cos(pm));
    op(2) = (1/r)*Vm*(sin(tm) - rho*sin(tt));
    op(3) = (1/r)*Vm*(rho*cos(tt)*sin(pt) - cos(tm)*sin(pm));
    op(4) = (Azm/Vm) + (Vm*tan(ly)*sin(pm)*(rho*cos(tt)*sin(pt) - cos(tm)*sin(pm)))/(r) - (Vm*cos(pm)*(rho*sin(tt) - sin(tm)))/(r);
    op51 = (Aym)/(Vm*cos(tm)) - (Vm*tan(tm)*cos(pm)*tan(ly)*(rho*cos(tt)*sin(pt) - cos(tm)*sin(pm)))/(r);
    op52 = -(Vm*tan(tm)*sin(pm)*(rho*sin(tt) - sin(tm)))/(r) - (Vm*(rho*cos(tt)*sin(pt) - cos(tm)*sin(pm)))/(r);
    op(5) = op51 + op52;
    op(6) = (Azt/Vt) + (Vm*tan(ly)*sin(pt)*(rho*cos(tt)*sin(pt) - cos(tm)*sin(pm)))/(r) - (Vm*cos(pt)*(rho*sin(tt) - sin(tm)))/(r);
    op71 = (Ayt)/(Vt*cos(tt)) - (Vm*tan(tt)*cos(pt)*tan(ly)*(rho*cos(tt)*sin(pt) - cos(tm)*sin(pm)))/(r);
    op72 = -(Vm*tan(tt)*sin(pt)*(rho*sin(tt) - sin(tm)))/(r) - (Vm*(rho*cos(tt)*sin(pt) - cos(tm)*sin(pm)))/(r);
    op(7) = op71 + op72;
end