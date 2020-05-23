global A_n B_n A B
Dis = (A(2, :) - A_n(2, :))*[(x1)'; (x2)'] + (B(2) - B_n(2))*control' + 2*sin(time').*cos(time') + 0.01*x1'.*x2';

stem(time, x1, 'b', 'filled');
hold on
stem(time, x1m, 'r', 'filled');
xlabel('Time');
ylabel('Values');
title('State x1 and State x1m');
legend('State x1', 'State x1m', 'Location', 'northwest');
grid on

figure;
stem(time, x2, 'b', 'filled');
hold on
stem(time, x2m, 'r', 'filled');
xlabel('Time');
ylabel('Values');
title('State x2 and State x2m');
legend('State x2', 'State x2m', 'Location', 'northwest');
grid on

figure;
stem(time, control, 'b', 'filled');
xlabel('Time');
ylabel('Values');
title('Control Input');
grid on

figure;
stem(time, (x1 - x1m), 'r', 'filled');
hold on
stem(time, (x2 - x2m), 'b', 'filled');
xlabel('Time');
ylabel('Values');
title('Tracking Errors');
legend('Error in x1', 'Error in x2', 'Location', 'southeast');
grid on

figure;
stem(time, Dis + ud', 'r', 'filled');
xlabel('Time');
ylabel('Values');
title('Disturbance Estimation Error');
grid on