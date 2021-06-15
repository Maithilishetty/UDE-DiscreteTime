global Ts tstep tstop

Dis = zeros(length(0:Ts:tstop), 2);
rD = downsample(r, Ts/tstep);
rdot = downsample(rdot, Ts/tstep);
e1 = downsample(e1, Ts/tstep);
e2 = downsample(e2, Ts/tstep);
errdot = downsample(errdot, Ts/tstep);

for i = 1:length(0:Ts:tstop)
    A = [-2*rdot(i)/rD(i) 0; 0 -2*rdot(i)/rD(i)];
    B = [1/rD(i) 0; 1/rD(i) -1/rD(i)];
    PB = pinv(B);
    Dis(i, :) = PB*(errdot(i, :)' - A*[e1(i)'; e2(i)'] - B*[Azm(i)'; Aym(i)']);
end

figure
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2)
plot(0:Ts:tstop, Aym, 'k')
xlabel('Time(s)');
ylabel({'Commanded Yaw Acceleration';'$A^{c}_{ym}$ (m s$^{-2}$)'});
grid on
set(gca, 'FontSize', 18)

figure
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2)
plot(0:Ts:tstop, Azm, 'k')
xlabel('Time(s)');
ylabel({'Commanded Pitch Acceleration';'$A^{c}_{zm}$ (m s$^{-2}$)'});
grid on
set(gca, 'FontSize', 18)

figure
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2)
plot(time, r, 'k')
xlabel('Time(s)');
ylabel('Missile to Target Range $r$ (m)');
grid on
set(gca, 'FontSize', 18)

figure
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2)
plot(time, lydot, 'k')
xlabel('Time(s)');
ylabel({'$y$-component of LOS rate';'$\dot{\lambda}_y$ (rad s$^{-1}$)'});
grid on
set(gca, 'FontSize', 18)

figure
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2)
plot(time, lzdot, 'k')
xlabel('Time(s)');
ylabel({'$z$-component of LOS rate';'$\dot{\lambda}_z$ (rad s$^{-1}$)'});
grid on
set(gca, 'FontSize', 18)

figure
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2)
plot(0:Ts:tstop, Dis(:, 1) + ud(:, 1), 'k')
xlabel('Time(s)');
ylabel('Disturbance Estimation Error 1');
grid on
set(gca, 'FontSize', 18)

figure
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2)
plot(0:Ts:tstop, Dis(:, 2) + ud(:, 2), 'k')
xlabel('Time(s)');
ylabel('Disturbance Estimation Error 2');
grid on
set(gca, 'FontSize', 18)