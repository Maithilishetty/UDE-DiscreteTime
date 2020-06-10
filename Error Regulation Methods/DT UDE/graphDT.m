global F F_n G G_n F_m G_m
ref = sin(2*pi*0.3*time);
Dis = (F(2, :)-F_n(2, :))*[x1'; x2'] + (G(2)-G_n(2))*control' + 0.01*(sin(time.*x1.*x1))' + (F_n(2, :) - F_m(2, :))*[x1'; x2'] - G_m(2)*ref';

stem(time, x1, 'b', 'filled');
hold on
stem(time, x1m, 'r', 'filled');
xlabel('Time');
ylabel('Value');
title('State x1 and State x1m');
legend('State x1', 'State x1m');
grid on

figure;
stem(time, x2, 'b', 'filled');
hold on
stem(time, x2m, 'r', 'filled');
xlabel('Time');
ylabel('Value');
title('State x2 and State x2m');
legend('State x2', 'State x2m');
grid on

figure;
stem(time, control, 'b', 'filled');
xlabel('Time');
ylabel('Value');
title('Control Input');
grid on

figure;
stem(time, e1, 'r', 'filled');
hold on
stem(time, e2, 'b', 'filled');
xlabel('Time');
ylabel('Value');
title('Tracking Errors');
legend('Error in x1', 'Error in x2');
grid on

figure;
stem(time, Dis + ud', 'r', 'filled');
xlabel('Time');
ylabel('Value');
title('Disturbance Estimation Error');
grid on