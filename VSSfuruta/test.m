fil_save = [];
for i = 1:si(1)
    clc;
    disp(i);
    x = x_save(1:i,:);
    fil_save = [fil_save;filter_low(x,fil_save)];
end