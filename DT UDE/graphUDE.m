global a1 a2 b a1_n a2_n b_n Dis

xref = sin(0.3*2*pi*time);

stem(time, xref, 'r', 'filled');
hold on
stem(time, x1, 'b', 'filled');
xlabel('Time');
ylabel('Values');
title('Reference input and State x1');
legend('Reference', 'State x1');
grid on

figure;
stem(time, control, 'b', 'filled');
xlabel('Time');
ylabel('Values');
title('Control Input');
grid on

figure
stem(time, obs_err, 'r', 'filled');
xlabel('Time');
ylabel('Value');
title('State Estimation Error');
grid on

figure;
stem(time, (xref - x1), 'r', 'filled');
xlabel('Time');
ylabel('Values');
title('Tracking Error');
grid on

figure;
D = (a1 - a1_n)*x1 + (a2 - a2_n)*x2 + (b - b_n)*control + Dis;
stem(time, D, 'r', 'filled');
xlabel('Time');
ylabel('Values');
title('Lumped Disturbance');
grid on