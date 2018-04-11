function u = VSScontroller(x,a,Params)
    k = Params.k;
    c = Params.c;
    s = x(4)+c*x(2);
    Y = [-c*x(4);x(4);x(2);x(3)];
    u = Y'*a-k*sign(s);
end