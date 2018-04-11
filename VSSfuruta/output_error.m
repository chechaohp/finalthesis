% Output error
function error = output_error(lambda,Phi,P,epxilon)
    den = lambda + trace(Phi'*P*Phi);
    error = epxilon/den;
end