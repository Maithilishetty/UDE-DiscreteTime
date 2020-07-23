global A_n B_n tstep Ts tstop r2d
e1 = downsample(e1, Ts/tstep);
e2 = downsample(e2, Ts/tstep);
err_dot = downsample(err_dot, Ts/tstep);
Dis = pinv(B_n)*(err_dot' - A_n*[e1'; e2'] - B_n*control');
x1 = x1*r2d;
x2 = x2*r2d;
x1_hat = x1_hat*r2d;
x2_hat = x2_hat*r2d;
x1m = x1m*r2d;
x2m = x2m*r2d;
e1 = e1*r2d;
e2 = e2*r2d;
err_est = err_est*r2d;

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, x1, 'k');
hold on
plot(time, x1m, 'k--');
xlabel('Time(s)');
ylabel('Roll Angle $\phi (^{\circ})$');
legend('System Roll Angle', 'Reference Roll Angle');
grid on
set(gca, 'FontSize', 18)

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, x2, 'k');
hold on
plot(0:Ts:tstop, x2_hat, 'k--');
xlabel('Time(s)');
ylabel('Roll Rate $p (^{\circ}s^{-1})$');
legend('Actual Roll Rate', 'Estimated Roll Rate');
grid on
set(gca, 'FontSize', 18)

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(0:Ts:tstop, control*r2d, 'k');
xlabel('Time(s)');
ylabel('Aileron Deflection $(^{\circ})$');
grid on
set(gca, 'FontSize', 18)

% figure;
% set(groot,'defaultAxesTickLabelInterpreter','latex');  
% set(groot,'defaulttextinterpreter','latex');
% set(groot,'defaultLegendInterpreter','latex');
% set(gcf, 'DefaultLineLineWidth', 1.5)
% plot(0:Ts:tstop, e1, 'k');
% xlabel('Time(s)');
% ylabel('Tracking Error in Roll Angle $(^{\circ})$');
% grid on
% set(gca, 'FontSize', 18)

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(0:Ts:tstop, Dis*r2d, 'k');
hold on
plot(0:Ts:tstop, -ud*r2d, 'k--');
xlabel('Time(s)');
ylabel('Disturbance and its Estimate');
legend('Disturbance $L(t)$', 'Estimate $\hat{L}(t)$');
grid on
set(gca, 'FontSize', 18)