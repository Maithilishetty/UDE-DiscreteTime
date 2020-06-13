global A A_n A_m B B_n B_m tstep Ts tstop
ref = sin(2*pi*0.3*time);
in = upsample(control, 10);
ud = upsample(ud, 10);
Dis = (A(2, :)-A_n(2, :))*[x1'; x2'] + (B(2)-B_n(2))*in(1:((tstop/tstep)+1))' + (5*sin(15*time) + 3*cos(5*time).*abs(x1).*x2 + 10*sin(10*time).*abs(x2).*x2)' + (A_n(2, :) - A_m(2, :))*[x1m'; x2m'] - B_m(2)*ref';
x1 = x1*180/pi;
x2 = x2*180/pi;
x1m = x1m*180/pi;
x2m = x2m*180/pi;
e1 = e1*180/pi;
e2 = e2*180/pi;

set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, x1, 'b');
hold on
plot(time, x1m, 'r--');
xlabel('Time');
ylabel('Roll Angle \phi(^o)');
legend('System Roll Angle', 'Reference Roll Angle');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, x2, 'b');
hold on
plot(time, x2m, 'r--');
xlabel('Time');
ylabel('Roll Rate $p(^os^{-1})$', 'Interpreter', 'latex');
legend('System Roll Rate', 'Reference Roll Rate');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(0:Ts:tstop, control, 'b');
xlabel('Time');
ylabel('Aileron Deflection (^o)');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, e1, 'r');
hold on
plot(time, e2, 'b--');
xlabel('Time');
ylabel('Tracking Errors');
legend('Error in Roll Angle', 'Error in Roll Rate');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, Dis + (ud(1:(tstop/tstep + 1)))', 'r');
xlabel('Time');
ylabel('Disturbance Estimation Error');
grid on