%Step Function - Plotting Sticky Prices
%Replication of Figure 4 (Original Research Paper):
%Core Government Spending Hike: Output Responses in Core and Periphery
%as a Function of Liquidity Trap Duration
%Varying Length of the Liquidity Trap

%Dynamic Effects of the Core Government Spending Shock and Consumption Taste Shock on ...
%Core and Periphery Output as an Average of the First Year

load avg_core_file.mat;
load avg_periphery_file.mat;
load liqduration_length_file.mat;


% Panel A: Benchmark (Slow) vs. Faster Price Adjustment, No Import Content in Core Government Spending
figure(1);
subplot(1,2,1);
stairs(liqduration_length (:,:,1), avg_periphery   (:,:,1), 'b'  ,  'linewidth',2); hold on;
stairs(liqduration_length (:,:,2), avg_periphery   (:,:,2), 'Color', [0.93 0.69 0.13] , 'linestyle', '--' , 'linewidth',2);
set(gca,'fontsize',10);
%suptitle('Benchmark (Slow) vs. Faster Price Adjustment, No Import Content');
title('Periphery Output (Average First Year)');
set(gca,'Ylim',[-1,7]);
set(gca,'YTick',[-1:1:7]);
set(gca,'Xlim',[0,13]);
set(gca,'XTick',[0:1:12]);
ylabel('Percent (Dev From Baseline)');
xlabel('Zero Lower Bound Duration');
legend('Benchmark Price Adjustment - \omega_G^{\ast} = 0 ', 'Fast Price Adjustment - \omega_G^{\ast} = 0 ');
hold off;

subplot(1,2,2);
stairs(liqduration_length (:,:,1), avg_core   (:,:,1), 'b'  ,  'linewidth',2); hold on;
stairs(liqduration_length (:,:,2), avg_core   (:,:,2), 'Color', [0.93 0.69 0.13] , 'linestyle', '--' ,  'linewidth',2);
set(gca,'fontsize',10);
title('Core Output (Average First Year)');
set(gca,'Ylim',[-1,7]);
set(gca,'YTick',[-1:1:7]);
set(gca,'Xlim',[0,13]);
set(gca,'XTick',[0:1:12]);
ylabel('Percent (Dev From Baseline)');
xlabel('Zero Lower Bound Duration');
legend('Benchmark Price Adjustment - \omega_G^{\ast} = 0 ', 'Fast Price Adjustment - \omega_G^{\ast} = 0.0 ');
hold off;


% Panel B: Benchmark (Slow) Price Adjustment, Varying the Degree of Import Content in Core Government Spending
figure(2);
subplot(1,2,1);
stairs(liqduration_length (:,:,1), avg_periphery   (:,:,1), 'b'  ,  'linewidth',2); hold on;
stairs(liqduration_length (:,:,3), avg_periphery   (:,:,3), 'r--',  'linewidth',2);
set(gca,'fontsize',10);
%suptitle('Benchmark Price Adjustment, Varying the Degree of Import Content');
title('Periphery Output (Average First Year)');
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
set(gca, 'YTickLabel',  {'' ,'0' ,'0.5' ,'1' ,'1.5' ,'2' });
set(gca,'Xlim',[0,13]);
set(gca,'XTick',[0:1:12]);
ylabel('Percent (Dev From Baseline)');
xlabel('Zero Lower Bound Duration');
legend('Benchmark Price Adjustment - \omega_G^{\ast} = 0 ', 'Benchmark Price Adjustment - \omega_G^{\ast} = 0.2 ');
hold off;

subplot(1,2,2);
stairs(liqduration_length (:,:,1), avg_core   (:,:,1), 'b'  ,  'linewidth',2); hold on;
stairs(liqduration_length (:,:,3), avg_core   (:,:,3), 'r--',  'linewidth',2);
set(gca,'fontsize',10);
title('Core Output (Average First Year)');
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
set(gca, 'YTickLabel',  {'' ,'0' ,'0.5' ,'1' ,'1.5' ,'2' });
set(gca,'Xlim',[0,13]);
set(gca,'XTick',[0:1:12]);
ylabel('Percent (Dev From Baseline)');
xlabel('Zero Lower Bound Duration');
legend('Benchmark Price Adjustment - \omega_G^{\ast} = 0 ', 'Benchmark Price Adjustment - \omega_G^{\ast} = 0.2 ');
hold off;
