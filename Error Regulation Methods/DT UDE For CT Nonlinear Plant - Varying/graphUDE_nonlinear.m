global A A_n A_m B B_n B_m tstep Ts tstop 
ref = 20*sin(0.4*pi*time);
inp = upsample(control, 10);
ud = upsample(ud, 10);
Dis = (A(2, :)-A_n(2, :))*[x1'; x2'] + (B(2)-B_n(2))*inp(1:((tstop/tstep)+1))' + (0.6141*x1 + 1.2099*x2 - 0.0513*x1.^2.*x2 + 0.035*x1.*x2.^2)' + (0.0135*x2.^3)' + (A_n(2, :) - A_m(2, :))*[x1m'; x2m'] - B_m(2)*ref';

set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, x1, 'b');
hold on
plot(time, x1m, 'r--');
xlabel('Time');
ylabel('Value');
title('State x1 and State xm1');
legend('State x1', 'State xm1');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, x2, 'b');
hold on
plot(time, x2m, 'r--');
xlabel('Time');
ylabel('Value');
title('State x2 and State xm2');
legend('State x2', 'State xm2');
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
plot(time, Dis + (ud(1:(tstop/tstep + 1)))', 'r');
xlabel('Time');
ylabel('Value');
title('Disturbance Estimation Error');
grid on