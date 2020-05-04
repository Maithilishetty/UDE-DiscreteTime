global Ts tstop

xref = sin(0.3*2*pi*time);

set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, xref, 'r');
hold on
plot(time, x1, 'b');
xlabel('Time');
ylabel('Value');
title('Reference input and State x1');
legend('Reference', 'State x1');
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
plot(time, (xref - x1), 'r');
xlabel('Time');
ylabel('Value');
title('Tracking Error for x1');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, obs_err, 'r');
xlabel('Time');
ylabel('Value');
title('State Estimation Error');
grid on