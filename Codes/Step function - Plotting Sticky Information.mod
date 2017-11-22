%Step Function - Plotting Sticky Information
%Model Extension: Sticky Information Phillips Curve
%Core Government Spending Hike: Output Responses in Core and Periphery
%as a Function of Liquidity Trap Duration
%Varying Length of the Liquidity Trap

%Dynamic Effects of the Core Government Spending Shock and Consumption Taste Shock on ...
%Core and Periphery Output as an Average of the First Year

load avg_core_file.mat;
load avg_periphery_file.mat;
load liqduration_length_file.mat;


% Panel C: Sticky Prices vs. Sticky Information, Slow Price Adjustment and No Import Content
figure(1);
subplot(1,2,1);
stairs(liqduration_length (:,:,1), avg_periphery   (:,:,1), 'b'  ,  'linewidth',2); hold on;
stairs(liqduration_length (:,:,5), avg_periphery   (:,:,5), 'g',  'linewidth',2);
set(gca,'fontsize',10);
%suptitle('Benchmark Sticky Prices vs. Sticky Information, Slow Price Adjustment and No Import Content');
title('Periphery Output (Average First Year)');
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
set(gca, 'YTickLabel',  {'' ,'0' ,'0.5' ,'1' ,'1.5' ,'2' });
set(gca,'Xlim',[0,13]);
set(gca,'XTick',[0:1:12]);
ylabel('Percent (Dev From Baseline)');
xlabel('Zero Lower Bound Duration');
legend('Sticky Price \omega_G^{\ast} = 0 ', 'Sticky Information - \omega_G^{\ast} = 0 ');
hold off;

subplot(1,2,2);
stairs(liqduration_length (:,:,1), avg_core   (:,:,1), 'b'  ,  'linewidth',2); hold on;
stairs(liqduration_length (:,:,5), avg_core   (:,:,5), 'g',  'linewidth',2);
set(gca,'fontsize',10);
title('Core Output (Average First Year)');
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
set(gca, 'YTickLabel',  {'' ,'0' ,'0.5' ,'1' ,'1.5' ,'2' });
set(gca,'Xlim',[0,13]);
set(gca,'XTick',[0:1:12]);
ylabel('Percent (Dev From Baseline)');
xlabel('Zero Lower Bound Duration');
legend('Sticky Price Adjustment - \omega_G^{\ast} = 0 ', 'Sticky Information - \omega_G^{\ast} = 0 ');
hold off;

% Panel D: Sticky Prices vs. Sticky Information, Faster Price Adjustment and No Import Content
figure(2);
subplot(1,2,1);
stairs(liqduration_length (:,:,2), avg_periphery   (:,:,2), 'Color', [0.93 0.69 0.13] , 'linestyle', '--' ,  'linewidth',2); hold on;
stairs(liqduration_length (:,:,6), avg_periphery   (:,:,6), 'c--',  'linewidth',2);
set(gca,'fontsize',10);
%suptitle('Sticky Prices vs. Sticky Information, Faster Price Adjustment and No Import Content');
title('Periphery Output (Average First Year)');
set(gca,'Ylim',[-1,7]);
set(gca,'YTick',[-1:1:7]);
set(gca,'Xlim',[0,13]);
set(gca,'XTick',[0:1:12]);
ylabel('Percent (Dev From Baseline)');
xlabel('Zero Lower Bound Duration');
legend('Fast Sticky Price Adjustment - \omega_G^{\ast} = 0 ', 'Fast Sticky Information Adjustment - \omega_G^{\ast} = 0 ');
hold off;

subplot(1,2,2);
stairs(liqduration_length (:,:,2), avg_core   (:,:,2), 'Color', [0.93 0.69 0.13] , 'linestyle', '--'  ,  'linewidth',2); hold on;
stairs(liqduration_length (:,:,6), avg_core   (:,:,6), 'c--',  'linewidth',2);
set(gca,'fontsize',10);
title('Core Output (Average First Year)');
set(gca,'Ylim',[-1,7]);
set(gca,'YTick',[-1:1:7]);
set(gca,'Xlim',[0,13]);
set(gca,'XTick',[0:1:12]);
ylabel('Percent (Dev From Baseline)');
xlabel('Zero Lower Bound Duration');
legend('Fast Sticky Price Adjustment - \omega_G^{\ast} = 0 ', 'Fast Sticky Information Adjustment - \omega_G^{\ast} = 0 ');
hold off;

% Panel E: Sticky Information (Slow Information Update) vs. Sticky Information (Faster Information Update), No Import Content
figure(3);
subplot(1,2,1);
stairs(liqduration_length (:,:,5), avg_periphery   (:,:,5), 'g'  ,  'linewidth',2); hold on;
stairs(liqduration_length (:,:,6), avg_periphery   (:,:,6), 'c--',  'linewidth',2);
set(gca,'fontsize',10);
%suptitle('Sticky Information: Slow vs. Faster Information Update, No Import Content');
title('Periphery Output (Average First Year)');
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
set(gca, 'YTickLabel',  {'' ,'0' ,'0.5' ,'1' ,'1.5' ,'2' });
set(gca,'Xlim',[0,13]);
set(gca,'XTick',[0:1:12]);
ylabel('Percent (Dev From Baseline)');
xlabel('Zero Lower Bound Duration');
legend('Slow Information Update - \omega_G^{\ast} = 0 ', 'Fast Information Update - \omega_G^{\ast} = 0 ');
hold off;

subplot(1,2,2);
stairs(liqduration_length (:,:,5), avg_core   (:,:,5), 'g'  ,  'linewidth',2); hold on;
stairs(liqduration_length (:,:,6), avg_core   (:,:,6), 'c--',  'linewidth',2);
set(gca,'fontsize',10);
title('Core Output (Average First Year)');
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
set(gca, 'YTickLabel',  {'' ,'0' ,'0.5' ,'1' ,'1.5' ,'2' });
set(gca,'Xlim',[0,13]);
set(gca,'XTick',[0:1:12]);
ylabel('Percent (Dev From Baseline)');
xlabel('Zero Lower Bound Duration');
legend('Slow Information Update - \omega_G^{\ast} = 0 ', 'Fast Information Update - \omega_G^{\ast} = 0 ');
hold off;


% Panel F: Sticky Information (Slow Information Update), Varying the Degree of Import Content
figure(4);
subplot(1,2,1);
stairs(liqduration_length (:,:,5), avg_periphery   (:,:,5), 'g'  ,  'linewidth',2); hold on;
stairs(liqduration_length (:,:,7), avg_periphery   (:,:,7), 'm-.',  'linewidth',2);
set(gca,'fontsize',10);
%suptitle('Sticky Information: Slow Information Update, Varying the Degree of Import Content');
title('Periphery Output (Average First Year)');
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
set(gca, 'YTickLabel',  {'' ,'0' ,'0.5' ,'1' ,'1.5' ,'2' });
set(gca,'Xlim',[0,13]);
set(gca,'XTick',[0:1:12]);
ylabel('Percent (Dev From Baseline)');
xlabel('Zero Lower Bound Duration');
legend('Slow Information Update - \omega_G^{\ast} = 0 ', 'Slow Information Update - \omega_G^{\ast} = 0.2 ');
hold off;

subplot(1,2,2);
stairs(liqduration_length (:,:,1), avg_core   (:,:,5), 'g'  ,  'linewidth',2); hold on;
stairs(liqduration_length (:,:,3), avg_core   (:,:,7), 'm-.',  'linewidth',2);
set(gca,'fontsize',10);
title('Core Output (Average First Year)');
set(gca,'Ylim',[-0.5,2]);
set(gca,'YTick',[-0.5:0.5:2]);
set(gca, 'YTickLabel',  {'' ,'0' ,'0.5' ,'1' ,'1.5' ,'2' });
set(gca,'Xlim',[0,13]);
set(gca,'XTick',[0:1:12]);
ylabel('Percent (Dev From Baseline)');
xlabel('Zero Lower Bound Duration');
legend('Slow Information Update - \omega_G^{\ast} = 0 ', 'Slow Information Update - \omega_G^{\ast} = 0.2 ');
hold off;
