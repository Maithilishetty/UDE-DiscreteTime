Dis = zeros(length(time), 2);
for i = 1:length(time)
    A = [-2*rdot(i)/r(i) 0; 0 -2*rdot(i)/r(i)];
    B = [1/r(i) 0; 1/r(i) -1/r(i)];
    PB = pinv(B);
    Dis(i, :) = PB*(errdot(i, :)' - A*[e1(i)'; e2(i)'] - B*[Azm(i)'; Aym(i)']);
end

set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2)
plot(time, Aym, 'k')
xlabel('Time(s)');
ylabel({'Commanded Yaw Acceleration';'$A^{c}_{ym}$ (m s$^{-2}$)'});
grid on
set(gca, 'FontSize', 18)

figure
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2)
plot(time, Azm, 'k')
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
plot(time, Dis(:, 1) + ud(:, 1), 'k')
xlabel('Time(s)');
ylabel('Disturbance Estimation Error 1');
grid on
set(gca, 'FontSize', 18)

figure
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(gcf, 'DefaultLineLineWidth', 2)
plot(time, Dis(:, 2) + ud(:, 2), 'k')
xlabel('Time(s)');
ylabel('Disturbance Estimation Error 2');
grid on
set(gca, 'FontSize', 18)