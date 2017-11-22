@#if price_adjustment
//Figure 1A
//Replication of Figure 5 (Original Research Paper):
//Rise in Core Government Spending: Faster Price Adjustment
//No Liquidity Trap

//Dynamic Effects of the Core Government Spending Shock on ...
//Real GDP, Inflation, Policy Rate and Terms of Trade

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
irfs_gov_D = oo_.endo_simul;


//Figure: Rise in Core Government Spending; No Liquidity Trap; Faster Price Adjustment
figure(1);
//Real GDP
subplot(3,1,1);
plot(2:25, irfs_gov_D (7, 2:25) , 'b',  'linewidth',2);hold on;
plot(2:25, irfs_gov_D (23, 2:25), 'g--','linewidth',2);hold on;
plot(2:25, irfs_gov_D (13, 2:25), 'r-.','linewidth',2);
set(gca,'fontsize',10);
//suptitle('No Liquidity Trap');
title('Real GDP');
@#if phillips_curve
set(gca,'Ylim',[-1,2]);
set(gca,'YTick',[-1:0.5:2]);
@#else
set(gca,'Ylim',[-0.5,3]);
set(gca,'YTick',[-0.5:0.5:3]);
@#endif
set(gca,'Xlim',[1,24]);
set(gca,'XTick',[2:4:24]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
xlabel('Quarters');
legend('Currency Union', 'Periphery','Core');

//Inflation
subplot(3,1,2);
plot(2:25, 4 * (irfs_gov_D (2, 2:25)) , 'b',  'linewidth',2);hold on;
plot(2:25, 4 * (irfs_gov_D (26, 2:25)), 'g--','linewidth',2);hold on;
plot(2:25, 4 * (irfs_gov_D (16, 2:25)), 'r-.','linewidth',2);
set(gca,'fontsize',10);
title('Inflation');
@#if phillips_curve
set(gca,'Ylim',[-6,3]);
set(gca,'YTick',[-6:1:3]);
@#else
set(gca,'Ylim',[-0.5,4]);
set(gca,'YTick',[-0.5:0.5:4]);
@#endif
set(gca,'Xlim',[1,24]);
set(gca,'XTick',[2:4:24]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
xlabel('Quarters');
legend('Currency Union', 'Periphery','Core');

//Policy Rate and Terms of Trade
subplot(3,1,3);
plot(2:25, 4 * (irfs_gov_D (3, 2:25)), 'b',  'linewidth',2);hold on;
plot(2:25,      irfs_gov_D (33, 2:25), 'g--','linewidth',2);hold on;
//plot(2:25,      irfs_gov_D (34, 2:25), 'r-.','linewidth',2);
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


//Save the file as PNG
print('NoLiquidityTrapFPA','-depsc','-r300');

//Calculate Liquidity Trap Duration
liqduration =  [sum(irfs_gov_D(3,1:end) == log(ibar))]



@#else
//Figure 1A
//Replication of Figure 3 (Original Research Paper):
//Rise in Core Government Spending
//No Liquidity Trap

//Dynamic Effects of the Core Government Spending Shock on ...
//Real GDP, Inflation, Policy Rate and Terms of Trade

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
irfs_gov_D = oo_.endo_simul;


//Figure: Rise in Core Government Spending; No Liquidity Trap
figure(1);
//Real GDP
subplot(3,1,1);
plot(2:25, irfs_gov_D (7, 2:25) , 'b',  'linewidth',2);hold on;
plot(2:25, irfs_gov_D (23, 2:25), 'g--','linewidth',2);hold on;
plot(2:25, irfs_gov_D (13, 2:25), 'r-.','linewidth',2);
set(gca,'fontsize',10);
//suptitle('No Liquidity Trap');
title('Real GDP');
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
set(gca,'Xlim',[1,24]);
set(gca,'XTick',[2:4:24]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
xlabel('Quarters');
legend('Currency Union', 'Periphery','Core');


//Inflation
subplot(3,1,2);
plot(2:25, 4 * (irfs_gov_D (2, 2:25)) , 'b',  'linewidth',2);hold on;
plot(2:25, 4 * (irfs_gov_D (26, 2:25)), 'g--','linewidth',2);hold on;
plot(2:25, 4 * (irfs_gov_D (16, 2:25)), 'r-.','linewidth',2);
set(gca,'fontsize',10);
title('Inflation');
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

//Policy Rate and Terms of Trade
subplot(3,1,3);
plot(2:25, 4 * (irfs_gov_D (3, 2:25)), 'b',  'linewidth',2);hold on;
plot(2:25,      irfs_gov_D (33, 2:25), 'g--','linewidth',2);hold on;
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
print('NoLiquidityTrap','-depsc','-r300');


//Calculate Liquidity Trap Duration
liqduration =  [sum(irfs_gov_D(3,1:end) == log(ibar))]

@#endif
