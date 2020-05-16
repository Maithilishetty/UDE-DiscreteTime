
stem(ans.time, ans.x1m, 'r', 'filled');
hold on
stem(ans.time, ans.x1, 'b', 'filled');
xlabel('Time');
ylabel('Values');
title('State x1m and State x1');
legend('State x1m', 'State x1');
grid on

figure;
stem(ans.time, ans.x2m, 'r', 'filled');
hold on
stem(ans.time, ans.x2, 'b', 'filled');
xlabel('Time');
ylabel('Values');
title('State x2m and State x2');
legend('State x2m', 'State x2');
grid on

figure;
stem(ans.time, ans.control, 'b', 'filled');
xlabel('Time');
ylabel('Values');
title('Control Input');
grid on

figure;
stem(ans.time, (ans.x1m - ans.x1), 'r', 'filled');
xlabel('Time');
ylabel('Values');
title('Tracking Error');
grid on

