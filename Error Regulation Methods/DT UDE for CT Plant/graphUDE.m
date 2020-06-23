global A_n B_n tstep Ts tstop
e1c = downsample(e1c, Ts/tstep);
e2c = downsample(e2c, Ts/tstep);
err_dotc = downsample(err_dotc, Ts/tstep);
Disc = pinv(B_n)*(err_dotc' - A_n*[e1c'; e2c'] - B_n*controlc');

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, x1, 'k');
hold on
plot(time, x1m, 'k--');
xlabel('Time(s)');
ylabel('$x_1(t)$ and $x_{1m}(t)$');
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
ylabel('$x_2(t)$ and $x_{2m}(t)$');
legend('State $x_2$', 'State $x_{2m}$');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(0:Ts:tstop, controlc, 'k');
xlabel('Time(s)');
ylabel('Control Input $u(t)$');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(0:Ts:tstop, e1c, 'k');
hold on
plot(0:Ts:tstop, e2c, 'k--');
xlabel('Time(s)');
ylabel('Tracking Errors $e_1(t)$ and $e_2(t)$');
legend('Error in $x_1$', 'Error in $x_2$');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(0:Ts:tstop, Disc, 'k');
hold on
plot(0:Ts:tstop, -udc, 'k--');
xlabel('Time(s)');
ylabel('Disturbance and its Estimate');
legend('Disturbance $L(t)$', 'Estimate $\hat{L}(t)$');
grid on