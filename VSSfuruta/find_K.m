function output = find_K(nuy,Params)
    g = Params.g;
    l = Params.L0/2;
    det = nuy(1)*nuy(2)-l^2*nuy(3)^2;
    A = [0,0,1,0;
        0,0,0,1;
        0,l*g*nuy(3)^2/det,-nuy(2)*nuy(4)/det,-l*nuy(3)*nuy(5)/det;
        0,g*nuy(1)*nuy(3)/det,-l*nuy(3)*nuy(4)/det,-nuy(1)*nuy(5)/det];
    B = [0;0;nuy(2)/det;l*nuy(3)/det];
    Q = diag([10,100,25,50]);
    r = 1;
    output = lqr(A,B,Q,r);
end