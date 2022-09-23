
A = [2 1 1;0 -17 0;0 0 -20];
B = [1 1;0 1;1 1];
C = [1 0 0];
D = [0 0];
syms tau;
cu = [0.5*sin(tau);0.4*cos(tau)];
Ku = [3 0;0 5];
x0 = [0.03;0.03;0.03];
c0 = Ereach(1).q;
K0 = Ereach(1).Q;
E0 = ellipsoid(K0,c0); 
sys = ss(A,B,C,D);
t0 = [0:0.1:10];
u = [0.8*sin(t0);0.7*cos(t0)];
[y,t1,x] = lsim(sys,u,t0,x0);
% figure;
% plot(t1,x);
xhat_pred =  c0;
Phat_pred = K0;
Ereach2 = E0;
upper_bound1 = zeros(length(t1)-1,1);
upper_bound2 = zeros(length(t1)-1,1);
volume2 = zeros(length(t1),1);
volume2(1) = 4/3*pi*sqrt(det(Ereach2.Q));
sigma=1;
for i = 1:1:length(t1)-1
    expmA = eye(3)+A*(t1(i+1)-tau)+A^2*(t1(i+1)-tau)^2/2+A^3*(t1(i+1)-tau)^3/6;
       fun = matlabFunction(expmA*B*cu);
    xc = integral(fun,t1(i),t1(i+1),'ArrayValued',true);
     fun1 = matlabFunction(expmA*B*Ku*B'*expmA');
     Mc = (t1(i+1)-t1(i))*integral(fun1,t1(i),t1(i+1),'ArrayValued',true);
     xhat_pred = expm(A*(t1(i+1)-t1(i)))*xhat_pred + xc;
     alpha = sqrt(trace(Mc))/(sqrt(trace(Mc))+sqrt(trace(expm(A*(t1(i+1)-t1(i)))*Phat_pred*expm(A'*(t1(i+1)-t1(i))))));
     Phat_pred = expm(A*(t1(i+1)-t1(i)))*Phat_pred*expm(A'*(t1(i+1)-t1(i)))/(1-alpha)+Mc/(sigma*alpha);
    % Including output measurement
%     xr = C\(y(i+1,:)'-D*double(subs(cu,t1(i+1))));
%     F = (pinv(D))'*(inv(Ku)-inv(Ku)*null(D)*pinv(null(D)'*inv(Ku)*null(D))*null(D)'*inv(Ku))*pinv(D);
%     opt_tr = 1e+10;
%     Phat_opt = zeros(length(xr));
%     xhat_opt = zeros(length(xr),1);
% %     if isIntersecting(ellipsoid((inv(Phat_pred)+inv(Phat_pred)')/2,xhat_pred),ellipsoid((C'*F*C+(C'*F*C)')/2,xr))
%         for lambda = 0.001:0.001:0.999    
%             X = lambda*inv(Phat_pred)+(1-lambda)*(C'*F*C);
%             k = 1-lambda*(1-lambda)*(xr-xhat_pred)'*(C'*F*C)*inv(X)*inv(Phat_pred)*(xr-xhat_pred);
%             xhat = inv(X)*(lambda*inv(Phat_pred)*xhat_pred+(1-lambda)*(C'*F*C)*xr);
%             Phat = k*inv(X);
%             if (trace(Phat)) < opt_tr 
%                 lambda_opt = lambda;
%                 Phat_opt = Phat;
%                 xhat_opt = xhat;
%                 opt_tr = trace(Phat);
%             end
%         end
%     lambda_list = [lambda_list lambda_opt];
%     del = y(i+1,:)'-D*double(subs(cu,t1(i+1)))-C*xhat_pred;
%     V = D*Ku*D';
%     Vbar = chol(inv(V));
%     Gbar = Vbar*C*Phat_pred*C'*Vbar';
%     gbar = max(eig(Gbar));
%     delbar = Vbar*del;
%     beta = (1-sigma)/(delbar'*delbar);
%     if sigma+delbar'*delbar <= 1
%         lambda = 0;
%         Phat = Phat_pred;
%         xhat = xhat_pred;
%     else
%         if gbar == 1
%             lambda = (1-beta)/2;
%         else
%             lambda = 1/(1-gbar)*(1-sqrt(gbar/(1+beta*(gbar-1))));
%         end
%         Q = 1/(1-lambda)*C*Phat_pred*C'+V/lambda;
%         sigma = (1-lambda)*sigma+lambda-del'*inv(Q)*del;
%         if sigma < 0
%             sigma=1;
%         end
%         O = 1/(1-lambda)*Phat_pred*C'*inv(Q);
%         Phat = (1/(1-lambda)*(eye(3)-O*C)*Phat_pred);
%         xhat = xhat_pred+O*del;
%     end
%     lambda_list = [lambda_list lambda];
    Ex = ellipsoid(sigma*(Phat_pred+Phat_pred')/2,xhat_pred);
    Ereach2 = [Ereach2 Ex];
%     Phat = (Phat_pred+Phat_pred')/2;
    volume2(i+1) = 4/3*pi*sqrt(det(Phat_pred));
end
b2 = zeros(length(t1),3,20000);
for j = 1:1:length(t1)
    b2(j,:,:) = boundary(Ereach2(j),20000);
end
% Reachable Set Plot
% figure;
% p1 = plot3(t1,squeeze(b(:,1,:)),squeeze(b(:,2,:)),'bo','MarkerSize',1,'DisplayName','Ellipsoidal Prediction');
% hold on;
% p2 = plot3(t1,x(:,1),x(:,2),'r-','DisplayName','True State'); 
% xlabel('t');ylabel('x1');zlabel('x2'); legend([p1(1),p2(:)]);
% title('Ellipsoidal Over-approximation without Correction Step');
% figure;
figure;
subplot(2,2,1);
plot3(squeeze(b2(2,1,:)),squeeze(b2(2,2,:)),squeeze(b2(2,3,:)),'bo','MarkerSize',1);hold on; plot3(x(2,1),x(2,2),x(2,3),'r*');
title(['t = ',num2str(t1(2))])
xlabel('x1');ylabel('x2');zlabel('x3')
subplot(2,2,2);
plot3(squeeze(b2(25,1,:)),squeeze(b2(25,2,:)),squeeze(b2(25,3,:)),'bo','MarkerSize',1);hold on; plot3(x(25,1),x(25,2),x(25,3),'r*');
title(['t = ',num2str(t1(25))])
xlabel('x1');ylabel('x2');zlabel('x3')
subplot(2,2,3);
plot3(squeeze(b2(50,1,:)),squeeze(b2(50,2,:)),squeeze(b2(50,3,:)),'bo','MarkerSize',1);hold on; plot3(x(50,1),x(50,2),x(50,3),'r*');
title(['t = ',num2str(t1(50))])
xlabel('x1');ylabel('x2');zlabel('x3')
subplot(2,2,4);
plot3(squeeze(b2(100,1,:)),squeeze(b2(100,2,:)),squeeze(b2(100,3,:)),'bo','MarkerSize',1);hold on; plot3(x(100,1),x(100,2),x(100,3),'r*');
title(['t = ',num2str(t1(100))])
xlabel('x1');ylabel('x2');zlabel('x3')
figure;
plot(t1,volume2);
% Upper bound for Hausdorff distance for Mc
% figure;
% plot(t1(1:100),upper_bound1);
% xlabel('t'); ylabel('Upper bound');grid on;
% title('Upper bound for Hausdorff distance for reachable set with x(0)=0');
% % Upper bound for Hausdorff distance for sum
% figure;
% plot(t1(1:100),upper_bound2);
% xlabel('t'); ylabel('Upper bound');grid on;
% title('Upper bound for Hausdorff distance for ellipsoidal sum');