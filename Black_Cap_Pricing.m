function [CapPrice, Caplet] = Black_Cap_Pricing(termStruct, strike, impliedVol, notional)
% 
% termStruct is a struct
%   1. Valuation Date: 'datenum'
%   2. Settle Date: [] datenum series
%   3. Maturity Date: [] datenum series
%   4. Forward rate Curve: [] forward rate series according to settle date
%   5. Spot rate curve: [] spot rate series (date match discount)
%

% tau i = investment horizon[0.25,0.25,0.25,0.25]
investmentHorizon = (termStruct.maturityDate - termStruct.settleDate)./365;

%termStruct.forward rate curve = [0.02,0.234,0.045,0.033] according to F(evaluationDate, settleDate, maturity Date)

%termStruct.spot rate curve = [0.98,0.97,0.95,0.94] according to P(evaluationDate, maturityDate)

impliedVol = impliedVol * (termStruct.settleDate - termStruct.evaluationDate)./365;
Caplet = notional.* BS(termStruct.forwardRateCurve,strike, impliedVol,1) .* investmentHorizon .*termStruct.spotRateCurve;

CapPrice = ones(size(Caplet))' * Caplet


