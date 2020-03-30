function output = ud(u)
    global tstep tau b
    output = -((1-exp(-(tstep/tau)))/(tstep*b))*(u(1)-u(2));
end
