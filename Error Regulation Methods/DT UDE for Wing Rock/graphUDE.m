global A_n B_n tstep Ts tstop r2d
in = upsample(control, Ts/tstep);
ud = upsample(ud, Ts/tstep);
Dis = pinv(B_n)*(err_dot' - A_n*[e1'; e2'] - B_n*(in(1:(tstop/tstep)+1))');
x1 = x1*r2d;
x2 = x2*r2d;
x1m = x1m*r2d;
x2m = x2m*r2d;
e1 = e1*r2d;
e2 = e2*r2d;

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, x1, 'b');
hold on
plot(time, x1m, 'r--');
ylim([-80 80])
xlabel('Time(s)');
ylabel('Roll Angle $\phi (^{\circ})$');
legend('System Roll Angle', 'Reference Roll Angle');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, x2, 'b');
xlabel('Time(s)');
ylabel('System Roll Rate $p (^{\circ}s^{-1})$');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(0:Ts:tstop, control*r2d, 'b');
xlabel('Time(s)');
ylabel('Aileron Deflection $(^{\circ})$');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, e1, 'r');
xlabel('Time(s)');
ylabel('Tracking Error in Roll Angle $(^{\circ})$');
grid on

figure;
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 1.5)
plot(time, (Dis + (ud(1:(tstop/tstep + 1)))')*r2d, 'r');
xlabel('Time(s)');
ylabel('Disturbance Estimation Error $(^{\circ}s^{-2})$');
grid on