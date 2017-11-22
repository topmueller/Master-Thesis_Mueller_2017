//Figure 4A
//Model Extension: Sticky Prices vs. Sticky Information
//Rise in Core Government Spending:
//Sensitivity Analysis

//Dynamic Effects of the Core Government Spending Shock on ...
//Real GDP and Output

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

//Generate built-in colormaps function
colorVec = lines;

//Sensitivity Analysis of Different Parameter Settings for Inflation and Output
figure(1);
//Currency Union Inflation
subplot(1,2,1);
plot(2:25, 4 * (irfs_gov_D (2, 2:25)) , 'Color',colorVec(i,:)); hold on
set(gca,'fontsize',10);
title(M_.endo_names_long(2,:));
@#if sensitivity_markup
set(gca,'Ylim',[-2,2]);
set(gca,'YTick',[-2:0.5:2]);
@#else
set(gca,'Ylim',[-2,4]);
set(gca,'YTick',[-2:1:4]);
@#endif
set(gca,'Xlim',[1,24]);
set(gca,'XTick',[2:4:24]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
xlabel('Quarters');
@#if sensitivity_markup
legend('\theta_p variation from 0.03 to 0.25');
@#else
legend('\xi_2 variation from 0.70 to 0.95');
@#endif

//Core Inflation
//subplot(1,3,2);
//plot(2:25, 4 * (irfs_gov_D (16, 2:25)), 'Color',colorVec(i,:)); hold on
//set(gca,'fontsize',10);
//title('Core Inflation');
//set(gca,'Xlim',[1,24]);
//set(gca,'XTick',[2:4:24]);
//set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
//xlabel('Quarters');
//legend('\xi_2 variation from 0.70 to 0.95');

//Periphery Inflation
//subplot(1,3,3);
//plot(2:25, 4 * (irfs_gov_D (26, 2:25)), 'Color',colorVec(i,:)); hold on
//set(gca,'fontsize',10);
//title('Periphery Inflation');
//set(gca,'Xlim',[1,24]);
//set(gca,'XTick',[2:4:24]);
//set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
//xlabel('Quarters');
//legend('\xi_2 variation from 0.70 to 0.95');

//Currency Union Output
subplot(1,2,2);
plot(2:25,  irfs_gov_D (7, 2:25) , 'Color',colorVec(i,:)); hold on
set(gca,'fontsize',10);
title(M_.endo_names_long(7,:));
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
set(gca,'Xlim',[1,24]);
set(gca,'XTick',[2:4:24]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
xlabel('Quarters');
@#if sensitivity_markup
legend('\theta_p variation from 0.03 to 0.25');
@#else
legend('\xi_2 variation from 0.70 to 0.95');
@#endif

figure(2);
//Core Output
subplot(1,2,1);
plot(2:25,  irfs_gov_D (13, 2:25), 'Color',colorVec(i,:)); hold on
set(gca,'fontsize',10);
title(M_.endo_names_long(13,:));
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
set(gca,'Xlim',[1,24]);
set(gca,'XTick',[2:4:24]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
xlabel('Quarters');
@#if sensitivity_markup
legend('\theta_p variation from 0.03 to 0.25');
@#else
legend('\xi_2 variation from 0.70 to 0.95');
@#endif

//Periphery Output
subplot(1,2,2);
plot(2:25,  irfs_gov_D (23, 2:25), 'Color',colorVec(i,:)); hold on
set(gca,'fontsize',10);
title(M_.endo_names_long(23,:));
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
set(gca,'Xlim',[1,24]);
set(gca,'XTick',[2:4:24]);
set(gca,'XTickLabel',{'0' ,'4' ,'8' ,'12' ,'16', '20'});
xlabel('Quarters');
@#if sensitivity_markup
legend('\theta_p variation from 0.03 to 0.25');
@#else
legend('\xi_2 variation from 0.70 to 0.95');
@#endif
