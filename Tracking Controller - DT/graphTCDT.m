xref = sin(2*pi*0.3*time);

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

figure;
stem(time, (xref - x1), 'r', 'filled');
xlabel('Time');
ylabel('Values');
title('Tracking Error');
grid on