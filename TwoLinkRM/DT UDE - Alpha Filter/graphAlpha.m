global A_n B_n
Disc = pinv(B_n)*(err_dotc' - A_n*[e1c'; e2c'; e3c'; e4c'] - B_n*controlc');

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2.25)
plot(time, x1, 'k');
hold on
plot(time, x1hat, 'k-.');
plot(time, x1m, 'k--');
xlabel('Time(s)');
ylabel('Position of joint 1');
legend('Actual Position', 'Estimated Position', 'Reference Position');
grid on
set(gca, 'FontSize', 18)

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2.25)
plot(time, x3, 'k');
hold on
plot(time, x3hat, 'k-.');
plot(time, x3m, 'k--');
xlabel('Time(s)');
ylabel('Position of joint 2');
legend('Actual Position', 'Estimated Position', 'Reference Position');
grid on
set(gca, 'FontSize', 18)

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2.25)
plot(time, x2, 'k');
hold on
plot(time, x2hat, 'k-.');
plot(time, x2m, 'k--');
xlabel('Time(s)');
ylabel('Velocity of joint 1');
legend('Actual Velocity', 'Estimated Velocity', 'Reference Velocity');
grid on
set(gca, 'FontSize', 18)

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2.25)
plot(time, x4, 'k');
hold on
plot(time, x4hat, 'k-.');
plot(time, x4m, 'k--');
xlabel('Time(s)');
ylabel('Velocity of joint 2');
legend('Actual Velocity', 'Estimated Velocity', 'Reference Velocity');
grid on
set(gca, 'FontSize', 18)

figure;
set(gcf, 'DefaultLineLineWidth', 2.25)
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(time, controlc(:, 1), 'k');
xlabel('Time(s)');
ylabel('Torque $\tau_1(t)$');
grid on
set(gca, 'FontSize', 18)

figure;
set(gcf, 'DefaultLineLineWidth', 2.25)
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(time, controlc(:, 2), 'k');
xlabel('Time(s)');
ylabel('Torque $\tau_2(t)$');
grid on
set(gca, 'FontSize', 18)

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2.25)
plot(time, Disc(1, :), 'k');
hold on
plot(time, -udc(:, 1), 'k--');
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
plot(time, Disc(2, :), 'k');
hold on
plot(time, -udc(:, 2), 'k--');
xlabel('Time(s)');
ylabel('Disturbance 2 and its Estimate');
legend('Disturbance $L_2(t)$', 'Estimate $\hat{L}_2(t)$');
grid on
set(gca, 'FontSize', 18)