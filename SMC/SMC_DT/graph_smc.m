set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, x1, 'b');
hold on
plot(time, xm1, 'r--');
xlabel('Time');
ylabel('Value');
title('State x1 and State x1m');
legend('State x1', 'State x1m');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, x2, 'b');
hold on
plot(time, xm2, 'r--');
xlabel('Time');
ylabel('Value');
title('State x2 and State x2m');
legend('State x2', 'State x2m');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, control, 'b');
xlabel('Time');
ylabel('Value');
title('Control Input');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, x1 - xm1, 'b');
hold on
plot(time, x2 - xm2, 'r--');
xlabel('Time');
ylabel('Value');
title('Tracking Errors');
legend('Error in x1', 'Error in x2');
grid on
