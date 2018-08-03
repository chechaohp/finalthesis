SimResults = [];
Params.x0 = [0;10/180*pi;0;0];
Params.m1 = 0.078;
Params.L0 = 0.157;
Params.L1 = 0.133;
Params.g = 9.81;
Params.J0 = 4.4*10^(-3);
Params.J1 = 5.5026*10^(-4);
Params.beta0 = 5.8*10^(-4);
Params.beta1 = 1.4142*10^(-3);
Params.muy = 0.5;
Params.lambda0 = 0.99;
Params.P0 = eye(5);
Params.sigma0 = [0;0;0;0;0];
Params.nuy0 = [0;0;0;0;0];

U = 0;
x = Params.x0;
x_save = [];
t_save = [];
% 
T = 0.001;		% Time interval for data collection
Iter = 0;
NumDataIntv = 5000;
%while norm(V_old-V) > denta 
K = [-3.1623   78.3643   -5.5454    8.4291];
for IterIntv = 0:NumDataIntv-1
    clc;
    disp(IterIntv);
    U = -K*x;
    [t,x] = ode45(@(t,x) plant(x,U,Params),...
    [IterIntv, IterIntv+1]*T,...
    x);
    x_save = [x_save;x(end,:)];
    t_save = [t_save;t(end)];
    x = x(end,:)';
end
figure();
plot(t_save,x_save(:,1:2));