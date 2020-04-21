% N = length_MSD; Note to self
% epsilon = loc_uncert; Note to self
function sigma = myMichaletFun(N, epsilon_val, alpha_val)
sigma = zeros(1,N);
for n = 1:N
    K = N - n; 
    if n <= K
        sigma(n) = sqrt(((n/(6*(K^2)))*(((4*(n^2)*K)+(2*K)-(n^3)+n)*(alpha_val^2))) + ((1/K)*((2*n*alpha_val*epsilon_val)+(1+(0.5*(1-(n/K)))*epsilon_val^2))));
    elseif n > K
        sigma(n) = sqrt(((1/(6*K))*(((6*(n^2)*K)-(4*n*(K^2))+(4*n)+(K^3)- K)*(alpha_val^2)))+ ((1/K)*((2*n*alpha_val*epsilon_val)+(epsilon_val^2))));
    end
end