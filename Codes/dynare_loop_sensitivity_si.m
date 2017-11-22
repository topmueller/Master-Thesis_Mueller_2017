%-------------------------------------------------------
% This file creates a loop for the sensitivity analysis under
% different values for information rigidity
%--------------------------------------------------------
clear all
clc

%% Give parameter values
v_xi2	= [0.70:0.01:0.95]; %benchmark: xi2 = 0.93;  faster information diffusion: xi2 = 0.88;  lower bound: xi2 = 0.70


%% Looping over xi2 and save results in a .mat file
for i = 1:length(v_xi2)

 xi2 =v_xi2(i);  
    
save parameterfile_si xi2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dynare nk_two_country_currency_union_model.mod  noclearall

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end