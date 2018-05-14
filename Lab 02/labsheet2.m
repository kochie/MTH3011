%
% Template for MTH3011 Computer Laboratory Sheet 2 in MATLAB
%
% Store the x and t values
%
nx=5;
x=linspace(0,1,nx+1)';
dx=x(2)-x(1);
%
nt=25;
t=linspace(0,2.5,nt+1);
dt=t(2)-t(1);
%
% Define some convenient scalar variables
%
K=0.1;
s=K*dt/(dx*dx);
%
% Store the initial and boundary conditions in the (nx+1)x(nt+1) matrix u_approx
%
u_approx(1:nx+1,1)= sin(pi*x(1:nx+1));% add missing part
%
u_approx(1,1:nt+1)=0;% add missing part
u_approx(nx+1,1:nt+1)=0; % add missing part
%
% Use the recurrence relation to determine the other values for each time step
%
for k=1:nt
    for i=2:nx
       u_approx(i,k+1)= s*u_approx(i-1,k)+(1-2*s)*u_approx(i,k)+s*u_approx(i+1,k);% add missing part
    end
end
%
% Create a mesh and then plot the results as a surface
%
[T,X]=meshgrid(t,x);
%
figure(1)
mesh(T,X,u_approx) % add missing part
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
title('Approximate solution of the heat equation with dt = 0.1')
%
% Write the results to an Excel file (or a text file if you prefer)
%
xlswrite('labsheet3.xls',x','dt=0.1, dx=0.2','B1:G1');
xlswrite('labsheet3.xls',[t' u_approx'],'dt=0.1, dx=0.2','A2:G27');

%
% Store and then plot the exact solution
%
u_exact= sin(pi*x)*exp(-K*pi^2*t);% add missing part
%
figure(2)
mesh(T,X,u_exact); % add missing part
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
title('Exact solution of the heat equation')
%
xlswrite('labsheet3ans.xls',x','Exact solution','B1:G1');
xlswrite('labsheet3ans.xls',[t' u_exact'],'Exact solution','A2:G27');

%
% Store and then plot the errors in the approximate solution
%
u_error=(u_exact-u_approx)*-1; % add missing part
%
figure(3)
mesh(T,X,u_error) % add missing part
xlabel('t')
ylabel('x')
zlabel('Errors')
title('Errors in the approximate solution of the heat equation with dt=0.1')

%
% Store t values for a larger time step dt=0.2
%
nt2=25;
t2=linspace(0,5,nt2+1);
dt2=t2(2)-t2(1);
%
% Redefine the scalar variable s
%
s2= K*dt2/(dx*dx);% add missing part
%
% Store the initial and boundary conditions in the (nx+1)x(nt+1) matrix u_approx
%
u_approx2(1:nx+1,1)=sin(pi*x(1:nx+1)); % add missing part
u_approx2(1,1:nt2+1)=0; % add missing part
u_approx2(nx+1,1:nt2+1)=0; % add missing part
%
% Now use the recurrence relation again to determine the other values
%
for k=1:nt2
    for i=2:nx
       u_approx2(i,k+1)=s2*u_approx2(i-1, k)+(1-2*s2)*u_approx2(i,k)+s2*u_approx2(i+1,k);% add missing part
    end
end
%
% Create a NEW mesh and then plot the results as a surface
%
[T2,X2]=meshgrid(t2,x);
%
figure(4)
mesh(T2,X2,u_approx2) % add missing part
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
title('Approximate solution of the heat equation with dt = 0.2')

%
% add missing lines based on using 30 time steps with dt=0.5
%
% end of labsheet2.m template


%
% Store t values for a larger time step dt=0.2
%
nt3=30;
t3=linspace(0,15,nt3+1);
dt3=t3(2)-t3(1);
%
% Redefine the scalar variable s
%
s3= K*dt3/(dx*dx);% add missing part
%
% Store the initial and boundary conditions in the (nx+1)x(nt+1) matrix u_approx
%
u_approx3(1:nx+1,1)=sin(pi*x(1:nx+1)); % add missing part
u_approx3(1,1:nt2+1)=0; % add missing part
u_approx3(nx+1,1:nt2+1)=0; % add missing part
%
% Now use the recurrence relation again to determine the other values
%
for k=1:nt3
    for i=2:nx
       u_approx3(i,k+1)=s3*u_approx3(i-1, k)+(1-2*s3)*u_approx3(i,k)+s3*u_approx3(i+1,k);% add missing part
    end
end
%
% Create a NEW mesh and then plot the results as a surface
%
[T3,X3]=meshgrid(t3,x);
%
figure(5)
mesh(T3,X3,u_approx3) % add missing part
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
title('Approximate solution of the heat equation with dt = 0.5')

%
% add missing lines based on using 30 time steps with dt=0.5
%
% end of labsheet2.m template