function [impliedVol] = Price_to_Vol(termStruct, strike, notional,CapPrice)
% 
% termStruct is a struct
%   1. Valuation Date: 'datenum'
%   2. Settle Date: [] datenum series
%   3. Maturity Date: [] datenum series
%   4. Forward rate Curve: [] forward rate series according to settle date
%   5. Spot rate curve: [] spot rate series (date match discount)
%

ivFun = @(v)((Black_Cap_Pricing(termStruct, strike, v, notional) - CapPrice))^2;
impliedVol = fmincon(ivFun,1);


