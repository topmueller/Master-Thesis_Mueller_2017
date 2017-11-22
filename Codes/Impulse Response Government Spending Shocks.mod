//Result Overview
//Impulse Responses to a Government Spending Shock
//The .mod file helps to understand the underlying processes of the model
//and gives a snapshot of the shock results to all endogenous variables

//FIRST SIMULATION (Government Shock Only)
//Government Spending Shock
//1,5% Increase of GDP in Core Government Spending
shocks;
var eps_gov_D;
periods 1:10;
values (sig_gov_D);
end;

//Deterministic Simulation of 50 Periods
simul(periods=50);

//Save Results
irfs_gov = oo_.endo_simul;

//SECOND SIMULATION (Taste Shock Only)
//No Government Spending Shock
shocks;
var eps_gov_D;
periods 1:10;
values (0);
end;

//Consumption Taste Shock
//6.3% Fall of GDP due to Consumption Taste Shock
//12 Quarter Liquidity Trap Duration
shocks;
var eps_con_CU;
periods 1:12;
values (sig_con_CU);
end;

//Deterministic Simulation of 50 Periods
simul(periods=50);

//Save Results
irfs_con = oo_.endo_simul;


//THIRD SIMULATION (Both Shocks)
//Government Spending Shock
//1,5% Increase of GDP in Core Government Spending
shocks;
var eps_gov_D;
periods 1:10;
values (sig_gov_D);
end;

//Consumption Taste Shock
//10% Fall of GDP due to Consumption Taste Shock
shocks;
var eps_con_CU;
periods 1:12;
values(sig_con_CU);
end;

//Deterministic Simulation of 50 Periods
simul(periods=50);

//Save Results
irfs_bothshocks = oo_.endo_simul;


//Curreny Union
figure(1);
subplot(4,3,1)
plot(2:20, irfs_gov(1,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(1,2:20) - irfs_con(1,2:20), 'b--');
title(M_.endo_names_long(1,:));
xlabel('Quarters');
legend('No Liquidity Trap', '12 Quarter Liquidity Trap');
//suptitle('Curreny Union')

subplot(4,3,2)
plot(2:20,irfs_gov(2,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(2,2:20) - irfs_con(2,2:20), 'b--');
title(M_.endo_names_long(2,:));
xlabel('Quarters');

subplot(4,3,3)
plot(2:20,irfs_gov(3,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(3,2:20) - irfs_con(3,2:20), 'b--');
title(M_.endo_names_long(3,:));
xlabel('Quarters');

subplot(4,3,4)
plot(2:20,irfs_gov(4,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(4,2:20) - irfs_con(4,2:20), 'b--');
title(M_.endo_names_long(4,:));
xlabel('Quarters');

subplot(4,3,5)
plot(2:20,irfs_gov(5,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(5,2:20) - irfs_con(5,2:20), 'b--');
title(M_.endo_names_long(5,:));
xlabel('Quarters');

subplot(4,3,6)
plot(2:20,irfs_gov(6,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(6,2:20) - irfs_con(6,2:20), 'b--');
title(M_.endo_names_long(6,:));
xlabel('Quarters');

subplot(4,3,7)
plot(2:20,irfs_gov(7,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(7,2:20) - irfs_con(7,2:20), 'b--');
title(M_.endo_names_long(7,:));
xlabel('Quarters');

subplot(4,3,8)
plot(2:20,irfs_gov(8,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(8,2:20) - irfs_con(8,2:20), 'b--');
title(M_.endo_names_long(8,:));
xlabel('Quarters');

subplot(4,3,9)
plot(2:20,irfs_gov(9,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(9,2:20) - irfs_con(9,2:20), 'b--');
title(M_.endo_names_long(9,:));
xlabel('Quarters');

subplot(4,3,10)
plot(2:20,irfs_gov(10,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(10,2:20) - irfs_con(10,2:20), 'b--');
title(M_.endo_names_long(10,:));
xlabel('Quarters');

subplot(4,3,11)
plot(2:20,irfs_gov(11,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(11,2:20) - irfs_con(11,2:20), 'b--');
title(M_.endo_names_long(11,:));
xlabel('Quarters');

subplot(4,3,12)
plot(2:20, irfs_gov(12,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(12,2:20) - irfs_con(12,2:20), 'b--');
title(M_.endo_names_long(12,:));
xlabel('Quarters');

//Core Economy
figure(2);
subplot(5,2,1)
plot(2:20, irfs_gov(13,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(13,2:20) - irfs_con(13,2:20), 'b--');
title(M_.endo_names_long(13,:));
xlabel('Quarters');
legend('No Liquidity Trap', '12 Quarter Liquidity Trap');
//suptitle('Core Economy')

subplot(5,2,2)
plot(2:20, irfs_gov(14,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(14,2:20) - irfs_con(14,2:20), 'b--');
title(M_.endo_names_long(14,:));
xlabel('Quarters');

subplot(5,2,3)
plot(2:20, irfs_gov(15,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(15,2:20) - irfs_con(15,2:20), 'b--');
title(M_.endo_names_long(15,:));
xlabel('Quarters');

subplot(5,2,4)
plot(2:20, irfs_gov(16,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(16,2:20) - irfs_con(16,2:20), 'b--');
title(M_.endo_names_long(16,:));
xlabel('Quarters');

subplot(5,2,5)
plot(2:20, irfs_gov(17,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(17,2:20) - irfs_con(17,2:20), 'b--');
title(M_.endo_names_long(17,:));
xlabel('Quarters');

subplot(5,2,6)
plot(2:20, irfs_gov(18,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(18,2:20) - irfs_con(18,2:20), 'b--');
title(M_.endo_names_long(18,:));
xlabel('Quarters');

subplot(5,2,7)
plot(2:20, irfs_gov(19,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(19,2:20) - irfs_con(19,2:20), 'b--');
title(M_.endo_names_long(19,:));
xlabel('Quarters');

subplot(5,2,8)
plot(2:20, irfs_gov(20,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(20,2:20) - irfs_con(20,2:20), 'b--');
title(M_.endo_names_long(20,:));
xlabel('Quarters');

subplot(5,2,9)
plot(2:20, irfs_gov(21,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(21,2:20) - irfs_con(21,2:20), 'b--');
title(M_.endo_names_long(21,:));
xlabel('Quarters');

subplot(5,2,10)
plot(2:20, irfs_gov(22,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(22,2:20) - irfs_con(22,2:20), 'b--');
title(M_.endo_names_long(22,:));
xlabel('Quarters');

//Periphery Economy
figure(3);
subplot(5,2,1)
plot(2:20, irfs_gov(23,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(23,2:20) - irfs_con(23,2:20), 'b--');
title(M_.endo_names_long(23,:));
xlabel('Quarters');
legend('No Liquidity Trap', '12 Quarter Liquidity Trap');
//suptitle('Periphery Economy')

subplot(5,2,2)
plot(2:20, irfs_gov(24,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(24,2:20) - irfs_con(24,2:20), 'b--');
title(M_.endo_names_long(24,:));
xlabel('Quarters');

subplot(5,2,3)
plot(2:20, irfs_gov(25,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(25,2:20) - irfs_con(25,2:20), 'b--');
title(M_.endo_names_long(25,:));
xlabel('Quarters');

subplot(5,2,4)
plot(2:20, irfs_gov(26,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(26,2:20) - irfs_con(26,2:20), 'b--');
title(M_.endo_names_long(26,:));
xlabel('Quarters');

subplot(5,2,5)
plot(2:20, irfs_gov(27,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(27,2:20) - irfs_con(27,2:20), 'b--');
title(M_.endo_names_long(27,:));
xlabel('Quarters');

subplot(5,2,6)
plot(2:20, irfs_gov(28,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(28,2:20) - irfs_con(28,2:20), 'b--');
title(M_.endo_names_long(28,:));
xlabel('Quarters');

subplot(5,2,7)
plot(2:20, irfs_gov(29,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(29,2:20) - irfs_con(29,2:20), 'b--');
title(M_.endo_names_long(29,:));
xlabel('Quarters');

subplot(5,2,8)
plot(2:20, irfs_gov(30,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(30,2:20) - irfs_con(30,2:20), 'b--');
title(M_.endo_names_long(30,:));
xlabel('Quarters');

subplot(5,2,9)
plot(2:20, irfs_gov(31,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(31,2:20) - irfs_con(31,2:20), 'b--');
title(M_.endo_names_long(31,:));
xlabel('Quarters');

subplot(5,2,10)
plot(2:20, irfs_gov(32,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(32,2:20) - irfs_con(32,2:20), 'b--');
title(M_.endo_names_long(32,:));
xlabel('Quarters');


//Difference Equations
figure(4);
subplot(3,2,1)
plot(2:20, irfs_gov(33,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(33,2:20) - irfs_con(33,2:20), 'b--');
title(M_.endo_names_long(33,:));
xlabel('Quarters');
legend('No Liquidity Trap', '12 Quarter Liquidity Trap');
//suptitle('Difference Equations')

subplot(3,2,2)
plot(2:20, irfs_gov(34,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(34,2:20) - irfs_con(34,2:20), 'b--');
title(M_.endo_names_long(34,:));
xlabel('Quarters');

subplot(3,2,3)
plot(2:20, irfs_gov(35,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(35,2:20) - irfs_con(35,2:20), 'b--');
title(M_.endo_names_long(35,:));
xlabel('Quarters');

subplot(3,2,4)
plot(2:20, irfs_gov(36,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(36,2:20) - irfs_con(36,2:20), 'b--');
title(M_.endo_names_long(36,:));
xlabel('Quarters');

subplot(3,2,5)
plot(2:20, irfs_gov(37,2:20), 'k');hold on;
plot(2:20, irfs_bothshocks(37,2:20) - irfs_con(37,2:20), 'b--');
title(M_.endo_names_long(37,:));
xlabel('Quarters');


//Calculate Liquidity Trap Duration
liqduration =  [sum(irfs_gov(3,1:end) == log(ibar))]

liqduration =  [sum(irfs_con(3,1:end) == log(ibar))]
