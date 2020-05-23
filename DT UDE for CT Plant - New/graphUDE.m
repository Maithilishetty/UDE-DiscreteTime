global Ts tstop A A_n B B_n
C = upsample(control', 10);
D = upsample(ud', 10);
Dis = (A(2, :) - A_n(2, :))*[(x1)'; (x2)'] + (B(2) - B_n(2))*C(1:10001) + (time.*sin(x1).*sin(x2))';

set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, x1, 'b');
hold on
plot(time, x1m, 'r--');
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
plot(time, x2m, 'r--');
xlabel('Time');
ylabel('Value');
title('State x2 and State x2m');
legend('State x2', 'State x2m');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(0:Ts:tstop, control, 'b');
xlabel('Time');
ylabel('Value');
title('Control Input');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, (x1 - x1m), 'r');
hold on
plot(time, (x2 - x2m), 'b--');
xlabel('Time');
ylabel('Value');
title('Tracking Errors');
legend('Error in x1', 'Error in x2');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, Dis + D(1:10001), 'r');
xlabel('Time');
ylabel('Value');
title('Disturbance Estimation Error');
grid on