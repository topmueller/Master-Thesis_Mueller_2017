%-------------------------------------------------------
% This file creates a loop for the sensitivity analysis under
% different values for monetary policy 
%--------------------------------------------------------
clear all
clc

%% Give parameter values
v_psi_pi	= [2:0.5:10];	    %psi_pi   =2.5
v_psi_xgap	= [0.1:0.1:1];    	%psi_xgap =0.125


%% Looping over psi and save results in a .mat file
for ii = 1:length(v_psi_xgap)
for i  = 1:length(v_psi_pi)
 
 psi_xgap =v_psi_xgap(ii);   
 psi_pi   =v_psi_pi(i);
    
save parameterfile_monetary_policy psi_pi psi_xgap

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dynare nk_two_country_currency_union_model.mod  noclearall

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
