function phi = Phi(a,Params)
    g = Params.g;
    l = Params.L0/2;
    th = a(1:2);
    th_d = a(3:4);
    th_2d = a(5:6);
    phi12 = sin(th(2))^2*th_2d(1)+sin(th(2))*th_d(1)*th_d(2);
    phi13 = l*(sin(th(2))*th_d(2)^2-cos(th(2))*th_2d(2));
    phi22 = th_2d(2)-sin(th(2))*cos(th(2))*th_d(2)^2;
    phi23 = -l*cos(th(2))*th_2d(1)-g*sin(th(2));
    phi = [th_2d(1),phi12,phi13,th_d(1),0;
        0,phi22,phi23,0,th_d(2)]';
end