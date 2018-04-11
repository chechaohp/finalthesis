%% lambda update
function lambda = lambda_update(lambda,Params)
    muy = Params.muy;
    lambda = (1-muy)*lambda+muy;
end