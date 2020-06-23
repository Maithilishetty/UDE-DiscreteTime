global F_n G_n
Dis = pinv(G_n)*(err_d' - F_n*[e1'; e2'] - G_n*control');

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, x1, 'k');
hold on
plot(time, x1m, 'k--');
xlabel('Time(s)');
ylabel('$x_1(k)$ and $x_{1m}(k)$');
legend('State $x_1$', 'State $x_{1m}$', 'Location', 'southeast');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, x2, 'k');
hold on
plot(time, x2m, 'k--');
xlabel('Time(s)');
ylabel('$x_2(k)$ and $x_{2m}(k)$');
legend('State $x_2$', 'State $x_{2m}$', 'Location', 'southeast');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, control, 'k');
xlabel('Time(s)');
ylabel('Control Input $u(k)$');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, e1, 'k');
hold on
plot(time, e2, 'k--');
xlabel('Time(s)');
ylabel('Tracking Errors $e_1(k)$ and $e_2(k)$');
legend('Error in $x_1$', 'Error in $x_2$');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, Dis, 'k');
hold on
plot(time, -ud, 'k--');
xlabel('Time(s)');
ylabel('Disturbance and its Estimate');
legend('Disturbance $L_d(k)$', 'Estimate $\hat{L}_d(k)$');
grid on