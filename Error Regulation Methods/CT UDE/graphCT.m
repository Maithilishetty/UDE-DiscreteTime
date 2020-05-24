global A A_n B B_n
Dis1 = (A(1, :)-A_n(1, :))*[x1'; x2'] + (B(1)-B_n(1))*control' + (x1.*x1)';
Dis2 = (A(2, :)-A_n(2, :))*[x1'; x2'] + (B(2)-B_n(2))*control' + (time.*sin(x1).*sin(x2))';
Dis = [Dis1; Dis2];
L = pinv(B_n)*Dis;

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
plot(time, control, 'b');
xlabel('Time');
ylabel('Value');
title('Control Input');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, e1, 'r');
hold on
plot(time, e2, 'b--');
xlabel('Time');
ylabel('Value');
title('Tracking Errors');
legend('Error in x1', 'Error in x2');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, L + ud', 'r');
xlabel('Time');
ylabel('Value');
title('Disturbance Estimation Error');
grid on