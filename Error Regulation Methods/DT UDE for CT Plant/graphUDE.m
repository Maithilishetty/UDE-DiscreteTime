global A_n B_n tstep Ts tstop
in = upsample(control, 10);
ud = upsample(ud, 10);
Dis = pinv(B_n)*(err_dot' - A_n*[e1'; e2'] - B_n*(in(1:(tstop/tstep)+1))');

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, x1, 'b');
hold on
plot(time, x1m, 'r--');
xlabel('Time(s)');
ylabel('$x_1(t)$ and $x_{1m}(t)$');
legend('State $x_1$', 'State $x_{1m}$', 'Location', 'southeast');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, x2, 'b');
hold on
plot(time, x2m, 'r--');
xlabel('Time(s)');
ylabel('$x_2(t)$ and $x_{2m}(t)$');
legend('State $x_2$', 'State $x_{2m}$');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(0:Ts:tstop, control, 'b');
xlabel('Time(s)');
ylabel('Control Input $u(t)$');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, e1, 'r');
hold on
plot(time, e2, 'b--');
xlabel('Time(s)');
ylabel('Tracking Errors $e_1(t)$ and $e_2(t)$');
legend('Error in $x_1$', 'Error in $x_2$');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, Dis + (ud(1:(tstop/tstep + 1)))', 'r');
xlabel('Time(s)');
ylabel('Disturbance Estimation Error $\tilde{L}(t)$', 'Interpreter', 'latex');
grid on