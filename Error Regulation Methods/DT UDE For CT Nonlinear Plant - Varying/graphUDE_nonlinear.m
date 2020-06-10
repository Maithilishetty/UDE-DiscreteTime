global A_n tstep Ts tstop c1 c2 a
ref = 20*sin(0.4*pi*time);
inp = upsample(control, 10);
udp = upsample(ud, 10);
Dis = (0.6141*x1 + 1.2099*x2 - 0.0513*x1.^2.*x2 + 0.035*x1.*x2.^2 + 0.0135*x2.^3)';
CDis = 0.5*inp(1:(tstop/tstep + 1))';
ADis = A_n(2, :)*[x1'; x2'];
alpha = [15; 17; 19; 21.5; 22.5; 23.75; 25]; %Different alpha values 
spread = [1.5; 1.5; 1.5; 2.0; 1; 1; 1];      %Different spread values
den = zeros(1, tstop/tstep + 1);
A = zeros(1, tstop/tstep + 1);
for l = 1:7
    den = den + exp(-((alpha_1'-alpha(l))/spread(l)).^2);
end
for i = 1:7
    A = A + (exp(-((alpha_1'-alpha(i))/spread(i)).^2)./den).*(-c1*a(i,1)*x1' + (c1*a(i,2) - c2)*x2' + c1*a(i,3)*(x2.^3)' + c1*a(i,4)*((x1.^2).*x2)' + c1*a(i,5)*(x1.*(x2.^2))');
end
D = A - ADis + CDis + Dis;

set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, x1, 'b');
hold on
plot(time, x1m, 'r--');
xlabel('Time');
ylabel('Value');
title('State x1 and State xm1');
legend('State x1', 'State xm1');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, x2, 'b');
hold on
plot(time, x2m, 'r--');
xlabel('Time');
ylabel('Value');
title('State x2 and State xm2');
legend('State x2', 'State xm2');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(0:Ts:tstop, control, 'b');
xlabel('Time');
ylabel('Value');
title('Control Input');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, e1, 'r');
hold on
plot(time, e2, 'b--');
xlabel('Time');
ylabel('Value');
title('Tracking Errors');
legend('Error in x1', 'Error in x2');
grid on

figure;
set(gcf, 'DefaultLineLineWidth', 1.5)
set(gca, 'FontSize', 24, 'FontWeight', 'bold')
plot(time, D + (udp(1:(tstop/tstep + 1)))', 'r');
xlabel('Time');
ylabel('Value');
title('Disturbance Estimation Error');
grid on