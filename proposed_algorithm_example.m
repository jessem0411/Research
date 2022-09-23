clc;clear all; close all;
A = [2 1 1;0 -17 0;0 0 -20];
D = [1 1;0 1;1 1];
C = [1 0 0];
F = [0 0];
syms tau;
cw = [0.5*sin(tau);0.4*cos(tau)];
Kw = [3 0;0 5];
x0 = [0.03;0.03;0.03];
K0 = diag([0.01 0.01 0.01]);
P1 = eye(3);
global A D;
n = size(A,1); %number of states
p = size(D,2); %number of inputs
options = odeset('AbsTol',1e-10,'RelTol',1e-10);
[t1,x] = ode45(@fun6, [0:0.1:10],x0,options);
w = zeros(length(t1),2);
for i=1:1:length(t1)
    w(i,:) = [0.8*sin(t1(i));0.7*cos(t1(i))];
end
y = C*x'+F*w';
ns = 1;
A1 = A(1:ns,1:ns);
D1 = D(1:ns,:);
C1 = C(1:ns);
F1 = F;
%Method for generating the strongly observable basis
R = zeros(n,n);
for i = 1:1:n
    R = A'*R*A +C'*C-(D'*R*A+F'*C)'*pinv(D'*R*D+F'*F)*(D'*R*A+F'*C);  % ARE equation
end
ns = rank(R,1e-3); %number of strongly observable states
fun1 = @(M)M'*M-R;
M0 = ones(ns,n);
options = optimoptions('fsolve','Display','off','Algorithm','levenberg-marquardt');
[M,fval,exitflag,output] = fsolve(fun1,M0,options); % strongly obsv basis of dim (ns x n)
V = null(M); %weakly unobsv basis
P1 = [M; pinv(V)];
fun2 = @(xsolve) [C*V+F*xsolve(1:p,:) - zeros(size(C,1),size(V,2));
A*V+D*xsolve(1:p,:) - V*xsolve(p+1:end,:)];
xsolve0 = ones(p+size(V,2),size(V,2));
[xsolve,fval,exitflag,output] = fsolve(fun2,xsolve0,options);
Kstar = xsolve(1:p,:);
Q = xsolve(p+1:end,:);
Kbarstar = Kstar*pinv(V);
Anew = P1*(A+D*Kbarstar)*pinv(P1);
Dnew = P1*D;
Cnew = (C+F*Kbarstar)*pinv(M);
Fnew = F;
A1 = Anew(1:ns,1:ns);
A2 = Anew(ns+1:end,1:ns);
A4 = Anew(ns+1:end,ns+1:end);
D1 = Dnew(1:ns,:);
D2 = Dnew(ns+1:end,:);
C1 = Cnew;
A3 = -D1*Kstar;
C2 = -F*Kstar;



%Construction of UIO
l = 0;
Jold = 0;
Jnew = F1;
ObsMat = C1;
l = 0;
while l <= size(A1,1)-size(null(F1),2)+1
     if rank(Jnew) - rank(Jold) == size(D1,2)
        alpha = l; % number of derivatives needed 
        break;
     end
     Jold = Jnew;
     Jnew = [F1 zeros(size(F1,1),size([ObsMat*D1 Jold],2)-size(F1,2));ObsMat*D1 Jold];
     ObsMat = [C1;ObsMat*A1];
     l=l+1;
end
if l > size(A1,1)-size(null(F1),2) + 1
    fprintf('Not possible to construct state\n');
end
options = optimoptions('fsolve','Display','off','Algorithm','levenberg-marquardt');
fun = @(S) S*Jnew - [D1 zeros(size(D1,1),size(Jnew,2)-size(D1,2))];
S0 = zeros(size(A1,1),size(Jnew,1));
[S,fval,exitflag,output] = fsolve(fun,S0,options);
N = null(Jnew')';
Guio = place((A1-S*ObsMat)',(N*ObsMat)',[-2.1]).'; % assume A_1-SOL,NOL are detectable
Euio = (A1-S*ObsMat)-Guio*N*ObsMat;
Fuio = S+Guio*N;
epsilon = 1e-3;
alpha = [1,2];
Ad = [-alpha(1)/epsilon 1;-alpha(2)/(epsilon^2) 0]; Bd  = [alpha(1)/epsilon;alpha(2)/(epsilon^2)];
global Ad Bd y t1;
[t2,deriv] = ode45(@hgo,[0:0.01:10],[0;0]); %[y1 y1dot]
global Euio Fuio deriv t2;
x0p = x0;
[t3,x1] = ode45(@uio2,[0:0.1:10],x0p(1));
eps1 = zeros(length(t3),1);
for i = 1:1:length(t3)
    eps1(i) = norm(expm(Euio*t3(i)))*sqrt(max(svds(P1*K0*P1')))+ norm(Fuio)*sqrt(2*2)*(0.001/2.1*(1-exp(-2.1*t3(i))) + (1.6684*sqrt(2)*10^(-6)-epsilon^2*0.001)/(epsilon*2.1-0.5)*(exp(-0.5*t3(i)/epsilon)-exp(-2.1*t3(i))));
end
eps1overbar = sqrt(max(svds(P1*K0*P1')))+norm(Fuio)*sqrt(2*2)*(0.001/2.1+(1.6684*sqrt(2)*10^(-6)-epsilon^2*0.001)/(epsilon*2.1-0.5));
eps1underbar = 0.001*(1-epsilon)/norm(Euio)*(1-exp(-norm(Euio)*t3(2)));

Ae = [-17 0;0 -20];
Be = [0 1;1 1];
Ce = [0 0];
De = [0 0];
xhat_pred =  x0p(2:3);
Phat_pred = max(svds(P1*K0*P1'))*eye(2);
Ereach = ellipsoid(K0,x0);
xbound = interval(ellipsoid(K0,zeros(3,1)));
% Ereach = E0;
volume = zeros(length(t3),1);
volume(1) = 4/3*pi*sqrt(det(Ereach.Q));
arralpha = zeros(length(t3));
for i = 1:1:length(t3)-1
    expmAe = eye(2)+Ae*(t3(i+1)-tau)+Ae^2*(t3(i+1)-tau)^2/2+Ae^3*(t3(i+1)-tau)^3/6;
    fun = matlabFunction(expmAe*Be*cw);
    xc = integral(fun,t3(i),t3(i+1),'ArrayValued',true);
    fun1 = matlabFunction(expmAe*Be*Kw*Be'*expmAe');
    Mc = (t3(i+1)-t3(i))*integral(fun1,t3(i),t3(i+1),'ArrayValued',true);
    xhat_pred = expm(Ae*(t3(i+1)-t3(i)))*xhat_pred + xc;
    alpha = sqrt(trace(Mc))/(sqrt(trace(Mc))+sqrt(trace(expm(Ae*(t3(i+1)-t3(i)))*Phat_pred*expm(Ae'*(t3(i+1)-t3(i))))));
    Phat_pred = expm(Ae*(t3(i+1)-t3(i)))*Phat_pred*expm(Ae'*(t3(i+1)-t3(i)))/(1-alpha)+Mc/alpha;
    arralpha(i) = alpha;
    xphat = [x1(i+1);xhat_pred];
    alp = sqrt(trace(Phat_pred)/(eps1(i+1)^2))+1; beta = alp/(alp-1);
    Pphat = [alp*(eps1(i+1)^2) zeros(1,2);zeros(2,1) beta*Phat_pred];
    Ex = ellipsoid((Pphat+Pphat')/2,xphat);
    Ereach = [Ereach Ex];
    xbound = [xbound interval(ellipsoid(Ex.Q,zeros(3,1)))];
    volume(i+1) = 4*pi/3*sqrt(det(Pphat));
end
b = zeros(length(t3),3,20000);
for j = 1:1:length(t3)
    b(j,:,:) = boundary(Ereach(j),20000);
end
% figure;
% subplot(2,2,1);
% plot3(squeeze(b(2,1,:)),squeeze(b(2,2,:)),squeeze(b(2,3,:)),'bo','MarkerSize',1);hold on; plot3(x(2,1),x(2,2),x(2,3),'r*');
% title(['t = ',num2str(t1(2))])
% xlabel('x1');ylabel('x2');zlabel('x3')
% subplot(2,2,2);
% plot3(squeeze(b(25,1,:)),squeeze(b(25,2,:)),squeeze(b(25,3,:)),'bo','MarkerSize',1);hold on; plot3(x(25,1),x(25,2),x(25,3),'r*');
% title(['t = ',num2str(t1(25))])
% xlabel('x1');ylabel('x2');zlabel('x3')
% subplot(2,2,3);
% plot3(squeeze(b(50,1,:)),squeeze(b(50,2,:)),squeeze(b(50,3,:)),'bo','MarkerSize',1);hold on; plot3(x(50,1),x(50,2),x(50,3),'r*');
% title(['t = ',num2str(t1(50))])
% xlabel('x1');ylabel('x2');zlabel('x3')
% subplot(2,2,4);
% plot3(squeeze(b(100,1,:)),squeeze(b(100,2,:)),squeeze(b(100,3,:)),'bo','MarkerSize',1);hold on; plot3(x(100,1),x(100,2),x(100,3),'r*');
% title(['t = ',num2str(t1(100))])
% xlabel('x1');ylabel('x2');zlabel('x3')
% figure;
% plot(t3,volume,'b-');

