clc
clear
syms x
f(x) = input('enter the function f(x):   ');% x^2 - x -1
fplot(f(x))
hold on
g(x) = input('enter the function g(x):   ');% 1 + 1/x
fplot(g(x))
x_0 = input('Give initial input:  ');
e = input('Give toleration:  ');
N = input('Give maximum number of iteration:   ');
step = 1;
flag = 1;
condition = 1;
while condition > 0
    x_temp = g(x_0);
    plot([x_0 x_0],[x_0 x_temp],'k-')
    plot([x_0 x_temp], [x_0 g(x_temp)], 'k--')
    pause
    x_0 = x_temp;
    step = step + 1;
    if step > N
        flag = 0;
        break;
    end
    if abs(f(x_temp)) > e
        condition = 1;
    end
    if flag==1
        fprintf('required root is %0.8f  \n',x_temp)
    else
        print('Not Convergent')
    end
end
hold off

