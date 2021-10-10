% Schwefel function investigation (F21)

clear
clc

currentFolder = pwd; % Current folder

syms f(x)
f(x) = -x*sin(sqrt(abs(x)))
fplot(f,[-500 500],'Linewidth',2);
legend('show','Location','best');
xlabel('x');
ylabel('y');
grid on

figureTitle='Investigation of the Schwefel function (F21)';
set(gcf, 'Position',  [200, 200, 800, 400]); % Position the figure on the screen
f1 = gcf;
saveas(f1,append(currentFolder,'\Figures\Schwefel\',figureTitle, '.fig'))
exportgraphics(f1,append(currentFolder,'\Figures\Schwefel\',figureTitle, '.emf'))
exportgraphics(f1,append(currentFolder,'\Figures\Schwefel\',figureTitle, '.png'),'Resolution',300)

syms x y
y=-x*sin(sqrt(x));
yd=diff(y,x)
s = vpasolve(yd==0,x, [400 500])

fmin=subs(f,x,s)
