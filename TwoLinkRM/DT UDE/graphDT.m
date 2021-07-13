global A_n B_n tstep Ts tstop
e1c = downsample(e1c, Ts/tstep);
e2c = downsample(e2c, Ts/tstep);
e3c = downsample(e3c, Ts/tstep);
e4c = downsample(e4c, Ts/tstep);
err_dotc = downsample(err_dotc, Ts/tstep);
Disc = pinv(B_n)*(err_dotc' - A_n*[e1c'; e2c'; e3c'; e4c'] - B_n*controlc');

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2.25)
plot(0:Ts:tstop, x1, 'k');
hold on
plot(time, x1m, 'k--');
xlabel('Time(s)');
ylabel('$\theta_1(t)$ and $\theta_{1m}(t)$');
legend('State $\theta_1$', 'State $\theta_{1m}$');
grid on
set(gca, 'FontSize', 18)

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2.25)
plot(time, x3, 'k');
hold on
plot(time, x3m, 'k--');
xlabel('Time(s)');
ylabel('$\theta_2(t)$ and $\theta_{2m}(t)$');
legend('State $\theta_2$', 'State $\theta_{2m}$');
grid on
set(gca, 'FontSize', 18)

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2.25)
plot(time, x2, 'k');
hold on
plot(time, x2m, 'k--');
xlabel('Time(s)');
ylabel('$\dot{\theta}_1(t)$ and $\dot{\theta}_{1m}(t)$');
legend('State $\dot{\theta}_1$', 'State $\dot{\theta}_{1m}$');
grid on
set(gca, 'FontSize', 18)

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2.25)
plot(time, x4, 'k');
hold on
plot(time, x4m, 'k--');
xlabel('Time(s)');
ylabel('$\dot{\theta}_2(t)$ and $\dot{\theta}_{2m}(t)$');
legend('State $\dot{\theta}_2$', 'State $\dot{\theta}_{2m}$');
grid on
set(gca, 'FontSize', 18)

figure;
set(gcf, 'DefaultLineLineWidth', 2.25)
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(0:Ts:tstop, controlc(:, 1), 'k');
xlabel('Time(s)');
ylabel('Torque $\tau_1(t)$');
grid on
set(gca, 'FontSize', 18)

figure;
set(gcf, 'DefaultLineLineWidth', 2.25)
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(0:Ts:tstop, controlc(:, 2), 'k');
xlabel('Time(s)');
ylabel('Torque $\tau_2(t)$');
grid on
set(gca, 'FontSize', 18)

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2.25)
plot(0:Ts:tstop, Disc(1, :), 'k');
hold on
plot(0:Ts:tstop, -udc(:, 1), 'k--');
xlabel('Time(s)');
ylabel('Disturbance 1 and its Estimate');
legend('Disturbance $L_1(t)$', 'Estimate $\hat{L}_1(t)$');
grid on
set(gca, 'FontSize', 18)

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2.25)
plot(0:Ts:tstop, Disc(2, :), 'k');
hold on
plot(0:Ts:tstop, -udc(:, 2), 'k--');
xlabel('Time(s)');
ylabel('Disturbance 2 and its Estimate');
legend('Disturbance $L_2(t)$', 'Estimate $\hat{L}_2(t)$');
grid on
set(gca, 'FontSize', 18)