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
saveas(fig1, 'prob1.png')

fig2 = figure();
plot(1:10, ones([1,10]))
title('PDE Total Population')
xlabel('τ')
ylabel('Total Population')
saveas(fig2, 'prob1-pop.png')


function u = phi(x,t)
    u = zeros(size(x));
    step = 1;
    for X=x
        if t > X
            u(step) = 1;
        else
            u(step) = exp(t-X);
        end
        step = step + 1;
    end
end
