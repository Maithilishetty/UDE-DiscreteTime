global A_n B_n tstep Ts tstop
r2d = 180/pi;
ref = sin(2*pi*0.3*time);
in = upsample(control, Ts/tstep);
ud = upsample(ud, Ts/tstep);
Dis = pinv(B_n)*(err_dot' - A_n*[e1'; e2'] - B_n*(in(1:(tstop/tstep)+1))');
x1 = x1*r2d;
x2 = x2*r2d;
x1m = x1m*r2d;
x2m = x2m*r2d;
e1 = e1*r2d;
e2 = e2*r2d;

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
plot(0:Ts:tstop, control*r2d, 'b');
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