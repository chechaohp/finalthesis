% Parameter adjusting
function output = nuy_adjust(nuy,P,Phi,error)
    output = nuy-P*Phi*error;
end