%% Plant
function dx = plant(x,U,Params)
    m1 = Params.m1;
    L0 = Params.L0;
    L1 = Params.L1;
    J0 = Params.J0;
    J1 = Params.J1;
    beta0 = Params.beta0;
    beta1 = Params.beta1;
    g = Params.g;
    u = [x;U];
	denta = J0*J1+m1^2*L1^4*sin(u(2))^2+m1^2*L0^2*L1^2+J0*m1*L1^2+J1*m1*L0^2+J1*m1*L1^2*sin(u(2))^2-m1^2*L0^2*L1^2*cos(u(2))^2;
    f1 = m1*L0*L1*cos(u(2))*(0.5*m1*L1^2*sin(2*u(2))*u(3)^2+m1*g*L1*sin(u(2))-beta1*u(4))-(m1*L1^2+J1)*(m1*L1^2*sin(2*u(2))*u(3)*u(4)+m1*L0*L1*sin(u(2))*u(4)^2-u(5)+beta0*u(3));
    f2 = (m1*L0^2+m1*L1^2*sin(u(2))^2+J0)*(0.5*m1*L1^2*sin(2*u(2))*u(3)^2+m1*g*L1*sin(u(2))-beta1*u(4))-m1*L0*L1*cos(u(2))*(m1*L1^2*sin(2*u(2))*u(3)*u(4)+m1*L0*L1*sin(u(2))*u(4)^2-u(5)+beta0*u(3));
    dx = [x(3);x(4);f1/denta;f2/denta];
end