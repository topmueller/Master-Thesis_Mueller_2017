%-------------------------------------------------------
% This file creates a loop for the sensitivity analysis under
% different values for the mark-up over marginal costs
%--------------------------------------------------------
clear all
clc

%% Give vector parameter values
v_theta_p = [0.03:0.01:0.25];	%theta_p =0.05 (Mankiw & Reis 2006), theta_p =0.2 (Trabandt 2009); 



%% Looping over theta_p and save results in a .mat file
for i  = 1:length(v_theta_p)
 
 theta_p =v_theta_p(i);  
     
save parameterfile_markup theta_p

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dynare nk_two_country_currency_union_model.mod  noclearall

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end