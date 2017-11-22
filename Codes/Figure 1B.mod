@#if price_adjustment
//Figure 1B
//Replication of Figure 5 (Original Research Paper):
//Rise in Core Government Spending and Taste Shock: Faster Price Adjustment
//12 Quarter Liquidity Trap

//Dynamic Effects of the Core Government Spending Shock and Consumption Taste Shock on ...
//Real GDP, Inflation, Policy Rate and Terms of Trade

//FIRST SIMULATION (Both Shocks)
//Government Spending Shock
//1,5% Increase of GDP in Core Government Spending
shocks;
var eps_gov_D;
periods 1:10;
values (sig_gov_D);
end;

//Consumption Taste Shock
//6.3% Fall of GDP due to Consumption Taste Shock
//Smaller Fall of GDP due to Consumption Taste Shock as a Result of more Flexible Prices
shocks;
var eps_con_CU;
periods 1:12;
values(sig_con_CU);
end;

//Deterministic Simulation of 50 Periods
simul(periods=50);

//Save Results
irfs_bothshocks = oo_.endo_simul;


//SECOND SIMULATION (Taste Shock Only)
//No Government Spending Shock
shocks;
var eps_gov_D;
periods 1:10;
values (0);
end;

//Consumption Taste Shock
//6.3% Fall of GDP due to Consumption Taste Shock
//Smaller Fall of GDP due to Consumption Taste Shock as a Result of more Flexible Prices
shocks;
var eps_con_CU;
periods 1:12;
values(sig_con_CU);
end;

//Deterministic Simulation of 50 Periods
simul(periods=50);

//Save Results
irfs_con = oo_.endo_simul;


//Figure: Rise in Core Government Spending; 12 Quarter Liquidity Trap; Faster Price Adjustment
figure(1);
//Real GDP w/ZLB
subplot(3,1,1);
plot(2:25, irfs_bothshocks(7,2:25)  - irfs_con(7,2:25) , 'b',  'linewidth',2);hold on;
plot(2:25, irfs_bothshocks(23,2:25) - irfs_con(23,2:25), 'g--','linewidth',2);hold on;
plot(2:25, irfs_bothshocks(13,2:25) - irfs_con(13,2:25), 'r-.','linewidth',2);
set(gca,'fontsize',10);
//suptitle('12 Quarter Liquidity Trap');
title('Real GDP w/ZLB');
@#if phillips_curve
set(gca,'Ylim',[-1,2]);
set(gca,'YTick',[-1:0.5:2]);
@#else
set(gca,'Ylim',[-0.5,5]);
set(gca,'YTick',[0:1:5]);
@#endif
set(gca,'Xlim',[1,24]);
set(gca,'XTick',[2:4:24]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
xlabel('Quarters');
legend('Currency Union', 'Periphery','Core');

//Inflation w/ZLB
subplot(3,1,2);
plot(2:25, 4 * (irfs_bothshocks(2,2:25)  - irfs_con(2,2:25)) , 'b',  'linewidth',2);hold on;
plot(2:25, 4 * (irfs_bothshocks(26,2:25) - irfs_con(26,2:25)), 'g--','linewidth',2);hold on;
plot(2:25, 4 * (irfs_bothshocks(16,2:25) - irfs_con(16,2:25)), 'r-.','linewidth',2);
set(gca,'fontsize',10);
title('Inflation w/ZLB');
@#if phillips_curve
set(gca,'Ylim',[-6,3]);
set(gca,'YTick',[-6:1:3]);
@#else
set(gca,'Ylim',[-0.5,15]);
set(gca,'YTick',[0:1:15]);
@#endif
set(gca,'Xlim',[1,24]);
set(gca,'XTick',[2:4:24]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
xlabel('Quarters');
legend('Currency Union', 'Periphery','Core');

//Policy Rate and Terms of Trade w/ZLB
subplot(3,1,3);
plot(2:25, irfs_bothshocks(3,2:25)  - irfs_con(3,2:25) , 'b',  'linewidth',2);hold on;
plot(2:25, irfs_bothshocks(33,2:25) - irfs_con(33,2:25), 'g--','linewidth',2);hold on;
set(gca,'fontsize',10);
title('Policy Rate and Terms of Trade');
@#if phillips_curve
set(gca,'Ylim',[-5,5]);
set(gca,'YTick',[-5:1:5]);
@#else
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
@#endif
set(gca,'Xlim',[1,24]);
set(gca,'XTick',[2:4:24]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
xlabel('Quarters');
legend('Policy Rate', 'Terms of Trade');


//Save the file as .eps
print('12QuarterLiquidityTrapFPA','-depsc','-r300');

//Calculate Liquidity Trap Duration
liqduration =  [sum(irfs_con(3,1:end) == log(ibar))]



@#else
//Figure 1B
//Replication of Figure 5 (Original Research Paper):
//Rise in Core Government Spending and Taste Shock
//12 Quarter Liquidity Trap

//Dynamic Effects of the Core Government Spending Shock and Consumption Taste Shock on ...
//Real GDP, Inflation, Policy Rate and Terms of Trade

//FIRST SIMULATION (Both Shocks)
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


//SECOND SIMULATION (Taste Shock Only)
//No Government Spending Shock
shocks;
var eps_gov_D;
periods 1:10;
values (0);
end;

//Consumption Taste Shock
//10% fall of GDP due to Consumption Taste Shock
shocks;
var eps_con_CU;
periods 1:12;
values(sig_con_CU);
end;

//Deterministic Simulation of 50 Periods
simul(periods=50);

//Save Results
irfs_con = oo_.endo_simul;


//Figure: Rise in Core Government Spending; 12 Quarters Liquidity Trap
figure(1);
//Real GDP w/ZLB
subplot(3,1,1);
plot(2:25, irfs_bothshocks(7,2:25)  - irfs_con(7,2:25) , 'b',  'linewidth',2);hold on;
plot(2:25, irfs_bothshocks(23,2:25) - irfs_con(23,2:25), 'g--','linewidth',2);hold on;
plot(2:25, irfs_bothshocks(13,2:25) - irfs_con(13,2:25), 'r-.','linewidth',2);
set(gca,'fontsize',10);
//suptitle('12 Quarter Liquidity Trap');
title('Real GDP w/ZLB');
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
set(gca,'Xlim',[1,24]);
set(gca,'XTick',[2:4:24]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
xlabel('Quarters');
legend('Currency Union', 'Periphery','Core');

//Inflation w/ZLB
subplot(3,1,2);
plot(2:25, 4 * (irfs_bothshocks(2,2:25)  - irfs_con(2,2:25)) , 'b',  'linewidth',2);hold on;
plot(2:25, 4 * (irfs_bothshocks(26,2:25) - irfs_con(26,2:25)), 'g--','linewidth',2);hold on;
plot(2:25, 4 * (irfs_bothshocks(16,2:25) - irfs_con(16,2:25)), 'r-.','linewidth',2);
set(gca,'fontsize',10);
title('Inflation w/ZLB');
@#if phillips_curve
set(gca,'Ylim',[-3,2]);
set(gca,'YTick',[-3:1:2]);
@#else
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
@#endif
set(gca,'Xlim',[1,24]);
set(gca,'XTick',[2:4:24]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
xlabel('Quarters');
legend('Currency Union', 'Periphery','Core');

//Policy Rate and Terms of Trade w/ZLB
subplot(3,1,3);
plot(2:25, irfs_bothshocks(3,2:25)  - irfs_con(3,2:25) , 'b',  'linewidth',2);hold on;
plot(2:25, irfs_bothshocks(33,2:25) - irfs_con(33,2:25), 'g--','linewidth',2);hold on;
set(gca,'fontsize',10);
title('Policy Rate and Terms of Trade');
@#if phillips_curve
set(gca,'Ylim',[-3,2]);
set(gca,'YTick',[-3:1:2]);
@#else
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
@#endif
set(gca,'Xlim',[1,24]);
set(gca,'XTick',[2:4:24]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
xlabel('Quarters');
legend('Policy Rate', 'Terms of Trade');


//Save the file as .eps
print('12QuarterLiquidityTrap','-depsc','-r300');


//Calculate Liquidity Trap Duration
liqduration =  [sum(irfs_con(3,1:end) == log(ibar))]

@#endif
