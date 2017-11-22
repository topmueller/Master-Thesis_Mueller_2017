%-------------------------------------------------------
% This file creates a loop for the sensitivity analysis under
% different values for import trade share
%--------------------------------------------------------
clear all
clc

%% Give parameter values
v_omegacon	    = [0:0.1:0.5];	  %omegacon     =0.2;
v_omegaconstar	= [0:0.1:0.5];    %omegaconstar =0.1;
v_omegagov	    = [0:0.1:0.5];	  %omegagov     =0;
v_omegagovstar	= [0:0.1:0.5];    %omegagovstar =0;

%% Looping over omega and save results in a .mat file
for iiii = 1:length(v_omegacon)
for iii  = 1:length(v_omegaconstar)   
for ii   = 1:length(v_omegagov)
for i    = 1:length(v_omegagovstar)

 omegacon     =v_omegaconstar(iiii);  
 omegaconstar =v_omegacon(iii);   
 omegagov     =v_omegaconstar(ii);  
 omegagovstar =v_omegacon(i);
    
save parameterfile_trade omegacon omegaconstar omegagov omegagovstar 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dynare nk_two_country_currency_union_model.mod  noclearall

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end