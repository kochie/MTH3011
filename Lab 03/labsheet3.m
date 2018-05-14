%
% Template for MTH3011 Computer Laboratory Sheet 3 in MATLAB
close all;
% Store x and t values
clear variables;
nx=30;
x=linspace(0,3,nx+1)';
dx=x(2)-x(1);
%
nt=20;
t=linspace(0,1,nt+1);
dt=t(2)-t(1);
%
% Create a mesh for surface plots
u_exact = zeros(nx+1, nt+1);
[T,X]=meshgrid(t,x);
%
% Store the EXACT solution for the same grid
%
for k=1:nt+1
    for i=1:nx+1
       u_exact(i,k) = -sign(x(i)-1-t(k)); % add missing part
    end
end
%
% Plot the EXACT solution u_exact as a series of line plots at each time t 
%
figure(1)
plot(x,u_exact)
xlabel('x')
ylabel('u(x,t)')
title('Exact solution of advection equation')
%
% Also plot the EXACT solution u_exact as a surface
%
figure(2)
mesh(X,T,u_exact)
xlabel('x')
ylabel('t')
zlabel('u(x,t)')
title('Exact solution of advection equation')
%
%
% Define a convenient scalar variable
%
alpha=dt/dx;
%
% Now use the FTCS method to calculate the APPROXIMATE solutions u_FTCS
%
% Store the initial and boundary conditions for u_FTCS
u_FTCS = zeros(nx+1,nt+1);
u_FTCS(1:nx+1,1)=-sign(x-1); % add missing part
%
u_FTCS(1,1:nt+1)=ones(1,nt+1); % add missing part
u_FTCS(nx+1,1:nt+1)= -ones(1,nt+1);% add missing part
%
% Store the APPROXIMATE solution u_FTCS using the FTCS method
%
for k=1:nt
    for i=2:nx
       u_FTCS(i,k+1)= u_FTCS(i,k) - alpha*(u_FTCS(i+1,k)-u_FTCS(i-1,k))/2;% add missing part
    end
end
%
% Plot the APPROXIMATE solution u_FTCS both as lines and as a surface
%
figure(3)
plot(x,u_FTCS) % add missing part
xlabel('x')
ylabel('u(x,t)')
title('Approximate solution by FTCS method for dt = 0.05 and dx = 0.1')
%
figure(4)
mesh(X,T,u_FTCS) % add missing part
xlabel('x')
ylabel('t')
zlabel('u(x,t)')
title('Approximate solution by FTCS method for dt = 0.05 and dx = 0.1')
%
%
% Now use Leith's method to calculate the APPROXIMATE solutions u_Leith
%
% Store the initial and boundary conditions for u_Leith
u_Leith = zeros(nx+1,nt+1);
u_Leith(1:nx+1,1)=-sign(x-1);% add missing part
%
u_Leith(1,1:nt+1)=ones(1,nt+1); % add missing part
u_Leith(nx+1,1:nt+1)=-ones(1,nt+1); % add missing part
%
% Store the APPROXIMATE solution u_Leith using Leiths method
%
for k=1:nt
    for i=2:nx
       u_Leith(i,k+1)= u_Leith(i,k)-alpha/2*(u_Leith(i+1,k)-u_Leith(i-1,k))+alpha^(2)/2*(u_Leith(i+1,k)-2*u_Leith(i,k)+u_Leith(i-1,k));
    end
end
%
% Plot the APPROXIMATE solution u_Leith both as lines and as a surface
%
figure(5)
plot(x,u_Leith) % add missing part
xlabel('x')
ylabel('u(x,t)')
title('Approximate solution by Leiths method for dt = 0.05 and dx = 0.1')
%
figure(6)
mesh(X,T,u_Leith) % add missing part
xlabel('x')
ylabel('t')
zlabel('u(x,t)')
title('Approximate solution by Leiths method for dt = 0.05 and dx = 0.1')
%
%
% Now use the upwind method to calculate the APPROXIMATE solutions u_upwind
%
% Store the initial and boundary condition for u_upwind
u_upwind = zeros(nx+1,nt+1);
u_upwind(1:nx+1,1)= -sign(x-1);% add missing part
%
u_upwind(1,1:nt+1)= ones(1,nt+1); % add missing part
%
% Store the APPROXIMATE solution u_upwind using the first-order upwind-difference method
%
for k=1:nt
    for i=2:nx+1
       u_upwind(i,k+1)=u_upwind(i,k)-alpha*(u_upwind(i,k)-u_upwind(i-1,k));
    end
end
%
% Plot the APPROXIMATE solution u_upwind both as lines and as a surface
%
figure(7)
plot(x,u_upwind) % add missing part
xlabel('x')
ylabel('u(x,t)')
title('Approximate solution by upwind method for dt = 0.05 and dx = 0.1')
%
figure(8)
mesh(X,T,u_upwind) % add missing part
xlabel('x')
ylabel('t')
zlabel('u(x,t)')
title('Approximate solution by upwind method for dt = 0.05 and dx = 0.1')
%
% end of labsheet3.m template