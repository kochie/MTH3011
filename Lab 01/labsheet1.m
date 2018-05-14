%
% Template for MTH3011 Computer Laboratory Sheet 1 in MATLAB
%
% Store t values
close all; clear variables;
nt=15;
t=linspace(0,3,nt+1);
dt=t(2)-t(1);
%
format long
%
% Store the exact solution at each time step
%
u_exact = 2*t.*exp(-t.*t);
%
% Use Euler's method to calculate approx values
u_euler = zeros(1,nt+1);
u_euler(1) = 0; % add missing part
for k=1:nt
   u_euler(k+1)=u_euler(k)+ dt*(2*exp(-t(k)*t(k)) - 2*t(k)*u_euler(k));% add missing part
end
error_euler=u_euler-u_exact;
fprintf(sprintf('The error for Euler(16) = %d\n', error_euler(16)))
%
% Use backward differences to calculate approx values
u_back = zeros(1,nt+1);
u_back(1)=0;
for k=1:nt
   u_back(k+1)= (u_back(k)+2*dt*exp(-t(k+1).*t(k+1)))/(1+dt*2*t(k+1)); % add missing part
end
error_back= u_back-u_exact;% add missing part
%
% Use centred differences to calculate approx values
u_cent = zeros(1,nt+1);
u_cent(1)=0;
for k=1:nt
    t_cent=t(k)+0.5*dt;
    u_cent(k+1)=(u_cent(k)*(1-dt.*t_cent)+2*dt*exp(-t_cent*t_cent))/(1+dt.*t_cent);% add missing part
end
error_cent = u_cent-u_exact;% add missing part

%
% Plot all of the results on the same graph
%
figure(1)
plot(t,u_exact,'o-',t,u_euler,'*--',t,u_back,'s:',t,u_cent,'p-.') % also modify to show all methods and exact solution
axis([0 3 0 1.2])
legend('exact', 'euler', 'back', 'cent')
xlabel('t')
ylabel('u(t)')
title('Solution of ODE by various methods for dt=0.2')
%
% Plot all of the errors on another graph
%
figure(2)
plot(t,error_euler,'+-',t,error_back, 'o--',t,error_cent, '*:')% also modify to show all methods
axis([0 3 -0.2 0.2])
legend('euler', 'back', 'cent')
xlabel('t')
ylabel('u(t)')
title('Errors in approximate solutions for dt=0.2')

%
% Write the table of results to an Excel file (or a text file if you prefer)
%
table=[t' u_exact' u_euler' error_euler' u_back' error_back' u_cent' error_cent'];
xlswrite('labsheet1.xls',{'t', 'u_exact', 'u_euler', 'error_euler', 'u_back', 'error_back', 'u_cent', 'error_cent'});
xlswrite('labsheet1.xls',table, 'Sheet1','A2'); % add missing part
% Repeat all of the above for the smaller timestep of dt2=0.1
%
nt=30;
t2=linspace(0,3,nt+1);
dt2=t2(2)-t2(1);
%
% Store the exact solution 
%
u_exact2 = 2*t2.*exp(-t2.*t2); % add missing part
%
% Use Euler's method to calculate approx values
u_euler2 = zeros(1,nt+1);
u_euler2(1)=0;
for k=1:nt
    u_euler2(k+1)=u_euler2(k)+ dt2*(2*exp(-t2(k)*t2(k)) - 2*t2(k)*u_euler2(k));% add missing part
end
error_euler2=u_euler2-u_exact2;
%
% Use backward differences to calculate approx values
u_back2 = zeros(1,nt+1);
u_back2(1)=0;
for k=1:nt
    u_back2(k+1)= (u_back2(k)+2*dt2*exp(-t2(k+1).*t2(k+1)))/(1+dt2*2*t2(k+1)); % add missing part
end
error_back2=u_back2-u_exact2;
%
% Use centred differences to calculate approx values
u_cent2 = zeros(1,nt+1);
u_cent2(1)=0;
for k=1:nt
    t_cent2=t2(k)+0.5*dt2;
    u_cent2(k+1)=(u_cent2(k)*(1-dt2.*t_cent2)+2*dt2*exp(-t_cent2*t_cent2))/(1+dt2.*t_cent2); % add missing part
end
error_cent2=u_cent2-u_exact2;

%
% Plot all of the results for dt2=0.1 on the same graph
%
figure(3)
plot(t2,u_exact2,'*--',t2,u_euler2,'+-',t2,u_back2,'s:',t2,u_cent2,'p-.')% also modify to show all methods and exact solution
axis([0 3 0 1.2])
legend('exact', 'euler', 'back', 'cent')
xlabel('t')
ylabel('u(t)')
title('Solution of ODE by various methods for dt=0.1')
%
% Plot all of the errors on another graph
%
figure(4)
plot(t2,error_euler2, '*-',t2,error_back2, 'p--',t2,error_cent2,'s-.') % also modify to show all methods
axis([0 3 -0.1 0.1])
legend('euler','back','cent')
xlabel('t')
ylabel('u(t)')
title('Errors in approximate solutions for dt=0.1')

%
% Scale the errors by dt and then plot them separately for each method 
%
figure(5)
plot(t,error_euler/dt,'+-',t2,error_euler2/dt2,'*--') % also modify to show dt2=0.1 results
axis([0 3 -0.2 1])
legend('euler', 'euler2')
xlabel('t')
ylabel('error/dt')
title('Error/dt for Euler''s method')
%
figure(6)
plot(t,error_back/dt,'+-',t2,error_back2/dt2, '*--') % also modify to show dt2=0.1 results
axis([0 3 -1 0.2])
legend('back', 'back2')
xlabel('t')
ylabel('error/dt')
title('Error/dt for backward-difference method')
%
figure(7)
plot(t,error_cent/dt^2,'+-',t2,error_cent2/dt2^2,'*--') % also modify to show dt2=0.1 results
axis([0 3 -0.2 0.4])
legend('cent', 'cent2')
xlabel('t')
ylabel('error/dt^2')
title('Error/dt^2 for centred-difference method')
%
% end of labsheet1.m template