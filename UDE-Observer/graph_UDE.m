xref = 10*sin(time);

set(gcf, 'DefaultLineLineWidth',1.5)
set(gca, 'FontSize',24,'FontWeight','bold')
plot(time, control, 'b');
xlabel('Time');
ylabel('Value');
title('Control');
grid on

figure
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, xref, 'r', time, x1, 'b');
xlabel('Time');
ylabel('Value');
legend('Reference', 'State x1', 'Location', 'northeast');
grid on

figure
set(gcf, 'DefaultLineLineWidth',1.5)
set(gca, 'FontSize',24,'FontWeight','bold')
plot(time, (xref - x1), 'r');
xlabel('Time');
ylabel('Value');
title('Tracking Error');
grid on

figure
set(gcf, 'DefaultLineLineWidth',1.5)
set(gca, 'FontSize',24,'FontWeight','bold')
plot(time, obs_err, 'r');
xlabel('Time');
ylabel('Value');
title('State Estimation Error');
grid on