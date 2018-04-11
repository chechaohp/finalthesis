% Prediction error
function epxilon = predict_error(i,Phi,sigma)
epxilon = [i;0] -  Phi'*sigma;
end