global F_n G_n
Dis = pinv(G_n)*(err_d' - F_n*[e1'; e2'] - G_n*control');

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, x1, 'b');
hold on
plot(time, x1m, 'r--');
xlabel('Time(s)');
ylabel('$x_1(k)$ and $x_{1m}(k)$');
legend('State $x_1$', 'State $x_{1m}$', 'Location', 'southeast');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, x2, 'b');
hold on
plot(time, x2m, 'r--');
xlabel('Time(s)');
ylabel('$x_2(k)$ and $x_{2m}(k)$');
legend('State $x_2$', 'State $x_{2m}$', 'Location', 'southeast');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, control, 'b');
xlabel('Time(s)');
ylabel('Control Input $u(k)$');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, e1, 'r');
hold on
plot(time, e2, 'b--');
xlabel('Time(s)');
ylabel('Tracking Errors $e_1(k)$ and $e_2(k)$');
legend('Error in $x_1$', 'Error in $x_2$');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, Dis + ud', 'r');
xlabel('Time(s)');
ylabel('Disturbance Estimation Error $\tilde{L}_d(k)$', 'Interpreter', 'latex');
grid on