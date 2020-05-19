global Ts tstop

set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(ans.time, ans.x1m, 'r');
hold on
plot(ans.time, ans.x1, 'b');
xlabel('Time');
ylabel('Value');
title('State x1m and State x1');
legend('State x1m', 'State x1');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(0:Ts:tstop, ans.control, 'b');
xlabel('Time');
ylabel('Value');
title('Control Input');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(ans.time, (ans.x1m - ans.x1), 'r');
xlabel('Time');
ylabel('Value');
title('Tracking Error for x1');
grid on
