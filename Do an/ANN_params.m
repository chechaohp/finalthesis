%clc;
%clear all;
m1=0.078;
%m1 = 0.1;
L0=0.157;
L1=0.133;
J0=4.4*10^(-3);
J1=5.5026*10^(-4);
beta0 = 5.8*10^(-4);
beta1 = 1.4142*10^(-3);
g = 9.81;
theta_0 = 0;
anpha_0 = 5;
denta1 = 3;
denta2 = 8;
kp = 1.05;
kd = 0.35;
alpha = 1;
N = 1.05*eye(10);
R = 8.53*eye(8);
W0 = [0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5;0.5];
Vhat_0 = zeros(8,10);
tf = 0.01;
tf2 = 1/250;
c=10;
ro=100*eye(4);
k=3;
Ts = 0.001;
muy =0.5;
P0 = eye(5);
%k = 1;