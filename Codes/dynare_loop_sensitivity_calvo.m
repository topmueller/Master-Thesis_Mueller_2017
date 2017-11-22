%-------------------------------------------------------
% This file creates a loop for the sensitivity analysis under
% different values for the Calvo parameter 
%--------------------------------------------------------
clear all
clc

%% Give parameter values
v_xi1	= [0.70:0.01:0.95];	%benchmark: xi1 = 0.93;  faster price adjustment: xi1 = 0.88;  lower bound: xi1 = 0.70


%% Looping over xi1 and save results in a .mat file
for i  = 1:length(v_xi1)
 
 xi1 =v_xi1(i);
    
save parameterfile_calvo xi1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dynare nk_two_country_currency_union_model.mod  noclearall

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
