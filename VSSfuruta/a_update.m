function a_dot = a_update(x,Params)
    shi = Params.shi;
    c = Params.c;
    Y = [-c*x(4);x(4);x(2);x(3)];
    s = x(4)+c*x(2);
    a_dot = -shi^(-1)*Y*s;
end