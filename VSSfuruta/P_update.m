%% lambda update
function P = P_update(Phi,P,lambda)
    P = 1/lambda*(P-(P*Phi*Phi'*P)/(lambda + trace(Phi'*P*Phi)));
end