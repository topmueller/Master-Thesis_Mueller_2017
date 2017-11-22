//Partial Effects of a Stepwise Inclusion of Lagged Expectations
//Model Extension: Sticky Information Phillips Curve

//Dynamic Effects of the Adverse Taste Shock on ...
//Currency Union Inflation [Core Inflation and Periphery Inflation]

//Consumption Taste Shock
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

//Highlight the Effects of lagged Expectations in the Sticky Information Framework
//Figure: Stepwise Inclusion of Lagged Expectations in the Sticky Information Phillips Curve
//Currency Union Inflation
figure(1);
plot(2:25, irfs_con (2, 2:25) , 'Color', [0.47 0.67 0.19] ,  'linewidth',2);
set(gca,'fontsize',16);
//title(M_.endo_names_long(2,:));
set(gca,'Ylim',[-10,10]);
set(gca,'YTick',[-10:2:10]);
set(gca,'XTick',[2:4:24]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
xlabel('Quarters');
legend('10 Lags', 'Location', 'SouthEast');                                             // Adjust Legend to the Change in Lagged Expectations

//Core Inflation
//figure(2);
//plot(2:25, irfs_con (16, 2:25) , 'b',  'linewidth',2);
//set(gca,'fontsize',12);
//title(M_.endo_names_long(16,:));
//set(gca,'XTick',[2:4:24]);
//set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
//xlabel('Quarters');

//Periphery Inflation
//figure(3);
//plot(2:25, irfs_con (26, 2:25) , 'b',  'linewidth',2);
//set(gca,'fontsize',12);
//title(M_.endo_names_long(26,:));
//set(gca,'XTick',[2:4:24]);
//set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
//xlabel('Quarters');


//Save the file as .eps
print('StepwiseInclusionStickyInformation','-depsc', '-r300');

//Calculate Liquidity Trap Duration
//liqduration =  [sum(irfs_con(3,1:end) == log(ibar))]
