SimResults = [];
Params.x0 = [0;5/180*pi;0;0];
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
Params.sigma0 = [1;1;1;1;1];
Params.nuy0 = [0;0;0;0;0];

U = 0;
x = Params.x0;
nuy = Params.nuy0;
lambda = Params.lambda0;
P = Params.P0;
sigma = Params.sigma0;

a_save = [];
x_save = [];
t_save = [];
s_save = [];
% 
T = 0.001;		% Time interval for data collection
Iter = 0;
NumDataIntv = 5000;
%while norm(V_old-V) > denta 
K = [-0.2500 20.6329 -0.6179 2.5406];
for IterIntv = 0:NumDataIntv-1
    U = -K*x;
    %update lambda
    lambda = lambda_update(lambda,Params);
    %calculate filter
    a = filter_low(x);
    %calculate Phi
    phi = Phi(a,Params);
    %prediction error
    epxilon = predict_error(U,phi,sigma);
    %output error
    e = output_error(lambda,phi,P,epxilon);
    %adjust nuy
    nuy = nuy_adjust(nuy,P,phi,e);
    %update P
    P = P_update(phi,P,lambda);
    % update sigma
    %sigma = sigma + nuy;
    [t,x] = ode45(@(t,x) plant(x,U,Params),...
    [IterIntv, IterIntv+1]*T,...
    x);
    s_save = [s_save;nuy'];
    x_save = [x_save;x(end,:)];
    t_save = [t_save;t(end)];
    x = x(end,:)';
end
figure();
plot(t_save,x_save(:,1:2));
figure();
plot(t_save,s_save);