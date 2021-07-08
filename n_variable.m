%% Generalized netton rapsion method
clc
clear
n_eqn=input('enter the number of non linear equations :');
%% creating and storing n_eqn number of functions
f=cell(n_eqn,1);
X=sym('x',[1,n_eqn]); 
for i=1:n_eqn
    f{i}=input('enter the non linear equation :');
    i=i+1;
end
%% entering initial approximations
x0=input('enter initial approximation(in single col): ');
eps=input('Allowed tolerance :   ');
%% creating iterations:    
err=1; %error in each iterartion
k=1; %to count number of iterations
F=cell(n_eqn,1); %created to use i while loop
J=cell(n_eqn,n_eqn);
while(err>eps)

% creating jacobian matrix
for i=1:n_eqn
    for j=1:n_eqn
        J{i,j}=diff(f{i},X(j));
        J{i,j}=subs(J{i,j},X,x0');
    end
end
J_s=cell2sym(J); %jacobina matrix in sym format
J_d=double(J_s); %jacobian matrix in double format

% creating F(i,e putting approximation in functions)
for i=1:n_eqn
    F{i}=subs(f{i},X,x0');
end
F_s=cell2sym(F); %jacobina matrix in sym format
F_d=double(F_s); %jacobian matrix in double format

x1= x0 - J_d\F_d;%Newton Raphson iteration
err= double(norm(x1-x0)/norm(x1));
%simplify(err)
k=k+1;
x0=x1; % update the approximation

end
%%
fprintf('The fixed point is %f \n', x1)
fprintf('Number of iterations required is %d. \n', k-1)