close all
clear variables

t = [0, 0.5 1 2 5];
x = 0:0.1:10;

fig1 = figure();
legendinfo = cell(size(t));
step = 1;
hold on
for T=t
    u = phi(x,T);
    plot(x,u)
    legendinfo{step} = sprintf('τ=%d', T);
    step = step+1;
end
title('PDE Solution at different τ')
xlabel('x')
ylabel('\phi(x,t)')
legend(legendinfo)
hold off
saveas(fig1, 'prob2.png')

fig2 = figure();
plot(1:10, ones([1,10]))
title('PDE Total Population')
xlabel('τ')
ylabel('Total Population')
saveas(fig2, 'prob2-pop.png')


function u = phi(x,~)
    u = exp(-x);
end
