%M�todo dos m�nimos quadrados
dados = load('arquivoEntrada.txt');
%Vetor de entradas
x = dados(:,1);
%Vetor de sa�das
y = dados(:,2);
n=size(x,1);
%Quantidade de amostras
quant = size(x,1);
soma_x=0;
soma_x2=0;
soma_x3=0;
soma_x4=0;
soma_x5=0;
soma_x6=0;
soma_y=0;
soma_xy=0;
soma_x2y=0;
soma_x3y=0;

%Somot�rio das entradas
for i=1:n
    soma_x = soma_x + x(i);
end
%Somat�rio do quadrado das entradas
for i=1:n
    soma_x2 = soma_x2 + (x(i)^2);
end
%Somat�rio dos cubos
for i=1:n
    soma_x3=soma_x3+(x(i)^3);
end
%Somat�rio da quarta
for i=1:n
    soma_x4=soma_x4+(x(i)^4);
end
%Somat�rio da quinta
for i=1:n
    soma_x5=soma_x5+(x(i)^5);
end
%Somat�rio da sexta
for i=1:n
    soma_x6=soma_x6+(x(i)^6);
end

%Somot�rio das sa�das
for i=1:n
    soma_y = soma_y + y(i);
end
%Somat�rio do produto entre entradas e sa�das
for i=1:n
    soma_xy = soma_xy + y(i)*x(i);
end
%Somat�rio do produto entre entradas ao quadrado e sa�das
for i=1:n
    soma_x2y = soma_x2y + y(i)*(x(i)^2);
end
%Somat�rio do produto entre entradas ao cubo e sa�das
for i=1:n
    soma_x3y = soma_x3y + y(i)*(x(i)^3);
end
A = [quant soma_x soma_x2 soma_x3; soma_x soma_x2 soma_x3 soma_x4; soma_x2 soma_x3 soma_x4 soma_x5;soma_x3 soma_x4 soma_x5 soma_x6];
D = [soma_y; soma_xy; soma_x2y; soma_x3y];
Aa = [soma_y soma_x soma_x2 soma_x3; soma_xy soma_x2 soma_x3 soma_x4;soma_x2y soma_x3 soma_x4 soma_x5;soma_x3y soma_x4 soma_x5 soma_x6];
Ab = [quant soma_y soma_x2 soma_x3; soma_x soma_xy soma_x3 soma_x4;soma_x2 soma_x2y soma_x4 soma_x4; soma_x3 soma_x3y soma_x5 soma_x6];
Ac = [quant soma_x soma_y soma_x3;soma_x soma_x2 soma_xy soma_x3 ; soma_x2 soma_x3 soma_x2y soma_x5;soma_x3 soma_x4 soma_x3y soma_x6];
Ad = [quant soma_x soma_x2 soma_y;soma_x soma_x2 soma_x3 soma_xy;soma_x2 soma_x3 soma_x4 soma_x2y; soma_x3 soma_x4 soma_x5 soma_x3y];
a1 = det(Aa)/det(A);
a2 = det(Ab)/det(A);
a3 = det(Ac)/det(A);
a4 = det(Ad)/det(A);
syms x1
funcao = a1 + a2*x1 + a3*(x1^2)+ a4*(x1^3);
figure(1);
plot(x,y,'*');
hold on
ezplot(funcao);
