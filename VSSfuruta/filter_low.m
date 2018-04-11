function filter_output = filter_low(x)
s = tf('s');
Gs = 1/(1+0.03*s)^3;
Gs_dot = s/((1+0.03*s)^3);
Gs_2dot = s^2/(1+0.03*s)^3;
Gz = c2d(Gs,0.001,'tustin');
Gz_dot = c2d(Gs_dot,0.001,'tustin');
Gz_2dot = c2d(Gs_2dot,0.001,'tustin');
[num,den] = tfdata(Gz,'v');
[num_dot,den_dot] = tfdata(Gz_dot,'v');
[num_2dot,den_2dot] = tfdata(Gz_2dot,'v');
a = filter(num,den,x(1:2));
a_dot = filter(num_dot,den_dot,x(1:2));
a_2dot = filter(num_2dot,den_2dot,x(1:2));
filter_output = [a,a_dot,a_2dot];
end