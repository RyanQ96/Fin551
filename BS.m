function [Option_Price] = BS(F, K, sigma, sign)
% Evaluation of the call and put values using Black-Scholes formula
%
% Input 
%        S: Current price of the underlying asset;
%        K: Strike price; 
%        r: (continuous) short-time interest rate for the period;
%        sigma: volatility in the B-S model;
%
%
% Output
%         Call: value of the European call,
%         Put : value of the European put.

d1 = (log(F./K)+ (sigma.^2)/ 2)./ (sigma);
d2 = d1 - sigma;

Call    =  F.* normcdf( d1 ) - K.* normcdf(d2);
Put     =  F .* -normcdf(-d1) + K .* normcdf(-d2); 
if sign == 1
    Option_Price = Call;
else
    Option_Price = Put;
end