global Ts tstop

xref = sin(2*pi*3*time);

plot(time, xref, 'r');
hold on
plot(time, x1, 'b');
xlabel('Time');
ylabel('Values');
title('Reference input and State x1');
legend('Reference', 'State x1');
grid on

figure;
plot(0:Ts:tstop, control, 'b');
xlabel('Time');
ylabel('Values');
title('Control Input');
grid on

figure;
plot(time, (xref - x1), 'r');
xlabel('Time');
ylabel('Values');
title('Tracking Error');
grid on