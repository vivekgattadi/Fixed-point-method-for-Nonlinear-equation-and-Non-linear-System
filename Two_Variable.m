%% Fixed point iteration to approximate 
%% the solution to the equation (x,y)=(f,g)(x,y))
%starting with initial guess x0 and iterating (x,y)(n+1)= (f,g)(x(n),y(n))
%%
syms x y
f(x,y) = input('enter the function f=f(x,y):   ');
g(x,y) = input('enter the function g=g(x,y):   ');

x0= input('Enter the initial approximation [x0(1) x0(2)]:   ');

 

% to check condition rho(A)<1

J = jacobian([f(x,y),g(x,y)],[x y])
J1 = subs(J,[x y], x0)

spectral_radius = max(abs(eig(inv(J1))));
if spectral_radius > 1
 disp('Iterations will not be converged or input correct initial approximation')
    return;
end

%% to perform iteration
err=1; %error in each iterartion
eps=input('Allowed tolerance :   ');
i=1; %to count no. of iteration

while err > eps
    J = jacobian([f(x,y),g(x,y)],[x y]);
    J2 = subs(J,[x y], x0);
    x1 = x0.' - inv(J2)*[double(f(x0(1),x0(2)));double(g(x0(1),x0(2)))];
    err= norm(x1-x0); %to compute error
    	
    i=i+1;
    x0=x1.'; % update the approximation
    
    if i > 3
        break
    end
end

fprintf('The fixed point is %f \n', x1)
fprintf('Number of iterations required is %d. \n', i-1)
