% figure;
% subplot(2,2,1);
% p1 = plot3(squeeze(b2(1,1,:)),squeeze(b2(1,1,:)),squeeze(b2(1,2,:)),'go','MarkerSize',1,'DisplayName','Ellipsoid Only');hold on; p2 = plot3(x(2,1),x(2,2),x(2,3),'r*','DisplayName','True State');
% p3 = plot3(squeeze(b(1,1,:)),squeeze(b(1,1,:)),squeeze(b(1,2,:)),'bo','MarkerSize',1,'DisplayName','Our Algorithm');
% legend([p1(1),p2(1),p3(1)]);
% title(['t = ',num2str(t1(1))])
% xlabel('x1');ylabel('x2');zlabel('x3');
% subplot(2,2,2);
% p1 = plot3(squeeze(b2(25,1,:)),squeeze(b2(25,2,:)),squeeze(b2(25,3,:)),'go','MarkerSize',1,'DisplayName','Ellipsoid Only');hold on; p2 = plot3(x(25,1),x(25,2),x(25,3),'r*','DisplayName','True State');
% p3 = plot3(squeeze(b(25,1,:)),squeeze(b(25,2,:)),squeeze(b(25,3,:)),'bo','MarkerSize',1,'DisplayName','Our Algorithm');
% legend([p1(1),p2(1),p3(1)]);
% title(['t = ',num2str(t1(25))])
% xlabel('x1');ylabel('x2');zlabel('x3');
% subplot(2,2,3);
% p1 = plot3(squeeze(b2(50,1,:)),squeeze(b2(50,2,:)),squeeze(b2(50,3,:)),'go','MarkerSize',1,'DisplayName','Ellipsoid Only');hold on; p2 = plot3(x(50,1),x(50,2),x(50,3),'r*','DisplayName','True State');
% p3 = plot3(squeeze(b(50,1,:)),squeeze(b(50,2,:)),squeeze(b(50,3,:)),'bo','MarkerSize',1,'DisplayName','Our Algorithm');
% legend([p1(1),p2(1),p3(1)]);
% title(['t = ',num2str(t1(50))])
% xlabel('x1');ylabel('x2');zlabel('x3');
% subplot(2,2,4);
% p1 = plot3(squeeze(b2(100,1,:)),squeeze(b2(100,2,:)),squeeze(b2(100,3,:)),'go','MarkerSize',1,'DisplayName','Ellipsoid Only');hold on; p2 = plot3(x(100,1),x(100,2),x(100,3),'r*','DisplayName','True State');
% p3 = plot3(squeeze(b(100,1,:)),squeeze(b(100,2,:)),squeeze(b(100,3,:)),'bo','MarkerSize',1,'DisplayName','Our Algorithm');
% legend([p1(1),p2(1),p3(1)]);
% title(['t = ',num2str(t1(100))])
% xlabel('x1');ylabel('x2');zlabel('x3');



% a = 4/3*pi*sqrt(det(diag([1.04e+5*0.1055^2 2.06e+4*43.71 2.06e+4*43.71])));
% b = 4/3*pi*sqrt(det(diag([(9.01e-5)^2 5.15e-9 5.15e-9])));
% volupbound = [];
% vollobound =[];
% for i=1:1:length(t3)
%     volupbound = [volupbound a];
%     vollobound = [vollobound b];
% end
% figure;
% semilogy([t1(1);t1(6:101)],[volume(1);volume(6:101)],'color','#A2142F','linewidth',2);hold on;semilogy(t1,volume2,'color','#0072BD','linewidth',2);
% %semilogy(t1,volupbound,'linewidth',2);semilogy(t1,vollobound,'linewidth',2);
% xlabel('t','interpreter','latex');ylabel('Volume','interpreter','latex');legend('Proposed Algorithm','ES-SME','interpreter','latex','location','northwest');
% grid;
% set(gca,'FontSize',14);

% figure;
% subplot(2,2,1);
% plot(Ereach(1),[1 2],'color','#0072BD','linewidth',1.2);hold on;plot(pupbound(1),[1 2],'color','#A2142F','linewidth',1.2);plot(x(1,1),x(1,2),'color','#77AC30','Marker','x','linewidth',2);
% title(['t = ',num2str(t1(1))])
% xlabel('$x_1$','interpreter','latex','FontSize',14);ylabel('$x_2$','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','$\overline{p}$','True State','interpreter','latex');
% subplot(2,2,2);
% plot(Ereach(25),[1 2],'color','#0072BD','linewidth',1.2);hold on;plot(pupbound(25),[1 2],'color','#A2142F','linewidth',1.2);plot(x(25,1),x(25,2),'color','#77AC30','Marker','x','linewidth',2);
% title(['t = ',num2str(t1(25))])
% xlabel('$x_1$','interpreter','latex','FontSize',14);ylabel('$x_2$','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','True State','interpreter','latex');
% subplot(2,2,3);
% plot(Ereach(50),[1 2],'color','#0072BD','linewidth',1.2);hold on;plot(pupbound(50),[1 2],'color','#A2142F','linewidth',1.2);plot(x(50,1),x(50,2),'color','#77AC30','Marker','x','linewidth',2);
% title(['t = ',num2str(t1(50))])
% xlabel('$x_1$','interpreter','latex','FontSize',14);ylabel('$x_2$','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','True State','interpreter','latex');
% subplot(2,2,4);
% plot(Ereach(100),[1 2],'color','#0072BD','linewidth',1.2);hold on;plot(pupbound(100),[1 2],'color','#A2142F','linewidth',1.2);plot(x(100,1),x(100,2),'color','#77AC30','Marker','x','linewidth',2);
% title(['t = ',num2str(t1(100))])
% xlabel('$x_1$','interpreter','latex','FontSize',14);ylabel('$x_2$','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','True State','interpreter','latex');
% 
% figure;
% subplot(2,2,1);
% plot(Ereach(1),[3 4],'color','#0072BD','linewidth',1.2);hold on;plot(Ereach2(1),[3 4],'color','#A2142F','linewidth',1.2);plot(x(1,3),x(1,4),'color','#77AC30','Marker','x','linewidth',2);
% title(['t = ',num2str(t1(1))])
% xlabel('$x_3$','interpreter','latex','FontSize',14);ylabel('$x_4$','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','True State','interpreter','latex');
% subplot(2,2,2);
% plot(Ereach(25),[3 4],'color','#0072BD','linewidth',1.2);hold on;plot(Ereach2(25),[3 4],'color','#A2142F','linewidth',1.2);plot(x(25,3),x(25,4),'color','#77AC30','Marker','x','linewidth',2);
% title(['t = ',num2str(t1(25))])
% xlabel('$x_3$','interpreter','latex','FontSize',14);ylabel('$x_4$','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','True State','interpreter','latex');
% subplot(2,2,3);
% plot(Ereach(50),[3 4],'color','#0072BD','linewidth',1.2);hold on;plot(Ereach2(50),[3 4],'color','#A2142F','linewidth',1.2);plot(x(50,3),x(50,4),'color','#77AC30','Marker','x','linewidth',2);
% title(['t = ',num2str(t1(50))])
% xlabel('$x_3$','interpreter','latex','FontSize',14);ylabel('$x_4$','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','True State','interpreter','latex');
% subplot(2,2,4);
% plot(Ereach(100),[3 4],'color','#0072BD','linewidth',1.2);hold on;plot(Ereach2(100),[3 4],'color','#A2142F','linewidth',1.2);plot(x(100,3),x(100,4),'color','#77AC30','Marker','x','linewidth',2);
% title(['t = ',num2str(t1(100))])
% xlabel('$x_3$','interpreter','latex','FontSize',14);ylabel('$x_4$','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','True State','interpreter','latex');




% figure;
% b12 = zeros(length(t3),2,3000);
% for i = 1:1:length(t3)
%     b12(i,:,:) = boundary(project(Ereach(i),[4 5]),3000);
% end
% c12 = zeros(length(t3),2,7000);
% for i = 1:1:length(t3)
%     c12(i,:,:) = boundary(project(Ereach2(i),[4 5]),7000);
% end
%  p1 = plot3(t3(1:7:71),squeeze(b12((1:7:71),1,:)),squeeze(b12((1:7:71),2,:)),'Marker','o','MarkerSize',2.5,'DisplayName','Proposed Algorithm','color','#0072BD','linestyle','none','MarkerFaceColor','#0072BD');
%  hold on;
%  p2 = plot3(t3(1:7:71),squeeze(c12((1:7:71),1,:)),squeeze(c12((1:7:71),2,:)),'Marker','o','MarkerSize',2.5,'DisplayName','ES-SME','color','#A2142F','linestyle','none','MarkerFaceColor','#A2142F');
%  p3 = plot3(t3(1:1:71),x((1:1:71),4),x((1:1:71),5),'color','#D95319','DisplayName','True State','linewidth',2);
% xlh = xlabel('t','interpreter','latex','FontSize',24);ylh = ylabel('$x_4$','interpreter','latex','FontSize',24);zlh = zlabel('$x_5$','interpreter','latex','FontSize',24); 
% LH(1) = plot(nan, nan,'color','#0072BD','linewidth',2);
% L{1} = 'Proposed Algorithm';
% LH(2) = plot(nan, nan,'color','#A2142F','linewidth',2);
% L{2} = 'ES-SME';
% LH(3) = plot(nan, nan,'color','#D95319','linewidth',2);
% L{3} = 'True State';
% legend(LH, L,'location','northwest','FontSize',20);grid;
% set(gca,'FontSize',20)
%  
% %  legend([p1(1),p3(:)],'location','northwest','FontSize',22);grid;
% % set(gca,'FontSize',24);
% % set(gca, 'YLimSpec', 'Tight');set(gca,'ZLimSpec','Tight');
% figure;
 plot(Ereach(36),[4 5],'color','#0072BD','linewidth',3);hold on;plot(Ereach2(36),[4 5],'color','#A2142F','linewidth',3);plot(x(36,4),x(36,5),'color','#D95319','Marker','x','linewidth',3);
xlabel('$x_4$','interpreter','latex','FontSize',20);ylabel('$x_5$','interpreter','latex','FontSize',20); grid;
set(gca,'FontSize',20);



% 
%  figure;
% subplot(2,2,1);
% plot(Ereach(1),[4 5],'color','#0072BD','linewidth',1.2);hold on;plot(Ereach2(1),[4 5],'color','#A2142F','linewidth',1.2);plot(x(1,4),x(1,5),'color','#77AC30','Marker','x','linewidth',2);
% title(['t = ',num2str(t1(1))])
% xlabel('$x_4$','interpreter','latex','FontSize',14);ylabel('$x_5$','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','True State','interpreter','latex');
% subplot(2,2,2);
% plot(Ereach(25),[4 5],'color','#0072BD','linewidth',1.2);hold on;plot(Ereach2(25),[4 5],'color','#A2142F','linewidth',1.2);plot(x(25,4),x(25,5),'color','#77AC30','Marker','x','linewidth',2);
% title(['t = ',num2str(t1(25))])
% xlabel('$x_4$','interpreter','latex','FontSize',14);ylabel('$x_5$','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','True State','interpreter','latex');
% subplot(2,2,3);
% plot(Ereach(50),[4 5],'color','#0072BD','linewidth',1.2);hold on;plot(Ereach2(50),[4 5],'color','#A2142F','linewidth',1.2);plot(x(50,4),x(50,5),'color','#77AC30','Marker','x','linewidth',2);
% title(['t = ',num2str(t1(50))])
% xlabel('$x_4$','interpreter','latex','FontSize',14);ylabel('$x_5$','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','True State','interpreter','latex');
% subplot(2,2,4);
% plot(Ereach(100),[4 5],'color','#0072BD','linewidth',1.2);hold on;plot(Ereach2(100),[4 5],'color','#A2142F','linewidth',1.2);plot(x(100,4),x(100,5),'color','#77AC30','Marker','x','linewidth',2);
% title(['t = ',num2str(t1(100))])
% xlabel('$x_4$','interpreter','latex','FontSize',14);ylabel('$x_5$','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','True State','interpreter','latex');

% % error
% e1 = zeros(5,length(t1));
% e2 = zeros(5,length(t2));
% for i = 1:1:length(t1)
%     e1(:,i) = Ereach(i).q-x(i,:)';
%     e2(:,i) = Ereach2(i).q-x(i,:)';
% end
% figure;
% subplot(2,3,1);
% plot(t1,e1(1,:),'color','#0072BD','linewidth',2);
% hold on;
% plot(t1,e2(1,:),'color','#A2142F','linewidth',2);
% ylabel('$e_1$','interpreter','latex','FontSize',14);xlabel('t','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','interpreter','latex');
% subplot(2,3,2);
% plot(t1,e1(2,:),'color','#0072BD','linewidth',2);
% hold on;
% plot(t1,e2(2,:),'color','#A2142F','linewidth',2);
% ylabel('$e_2$','interpreter','latex','FontSize',14);xlabel('t','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','interpreter','latex');
% subplot(2,3,3);
% plot(t1,e1(3,:),'color','#0072BD','linewidth',2);
% hold on;
% plot(t1,e2(3,:),'color','#A2142F','linewidth',2);
% ylabel('$e_3$','interpreter','latex','FontSize',14);xlabel('t','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','interpreter','latex');
% subplot(2,3,4);
% plot(t1,e1(4,:),'color','#0072BD','linewidth',2);
% hold on;
% plot(t1,e2(4,:),'color','#A2142F','linewidth',2);
% ylabel('$e_4$','interpreter','latex','FontSize',14);xlabel('t','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','interpreter','latex');
% subplot(2,3,5);
% plot(t1,e1(5,:),'color','#0072BD','linewidth',2);
% hold on;
% plot(t1,e2(5,:),'color','#A2142F','linewidth',2);
% ylabel('$e_5$','interpreter','latex','FontSize',14);xlabel('t','interpreter','latex','FontSize',14); grid;
% legend('Algorithm 1','Liu et al. [2016]','interpreter','latex');

% figure;
% p1 = plot3(t3(1:10:101),squeeze(b((1:10:101),1,:)),squeeze(b((1:10:101),2,:)),'bo','MarkerSize',1,'DisplayName','Algorithm 1');
% hold on;
% p2 = plot3(t3(1:10:101),squeeze(b2((1:10:101),1,:)),squeeze(b2((1:10:101),2,:)),'ro','MarkerSize',1,'DisplayName','Liu et al. [2016]');
% p3 = plot3(t1(1:10:101),x((1:10:101),1),x((1:10:101),2),'g-','DisplayName','True State'); 
% xlabel('t');ylabel('x1');zlabel('x2'); legend([p1(1),p2(1),p3(:)]);

%figure;
% subplot(2,2,[3 4]);
% plot(t1,xbound.inf(1,:),'linewidth',2);hold on; plot(t1,xbound.sup(1,:),'linewidth',2);plot(t1,pupbound.sup(1,:),'linewidth',2);plot(t1,plobound.inf(1,:),'linewidth',2);
% xlabel('t','interpreter','latex','FontSize',14);ylabel('$x_1$','interpreter','latex','FontSize',14);grid;
% legend('$\underline{x}_1$','$\overline{x}_1$','$\overline{p}_1$','$\underline{p}_1$','interpreter','latex')
% subplot(2,2,1);
% plot(t1,xbound.inf(2,:),'linewidth',2);hold on; plot(t1,xbound.sup(2,:),'linewidth',2);plot(t1,pupbound.sup(2,:),'linewidth',2);plot(t1,plobound.inf(2,:),'linewidth',2);
% xlabel('t','interpreter','latex','FontSize',14);ylabel('$x_2$','interpreter','latex','FontSize',14);grid;
% subplot(2,2,2);
% plot(t1,xbound.inf(3,:),'linewidth',2);hold on; plot(t1,xbound.sup(3,:),'linewidth',2);plot(t1,pupbound.sup(3,:),'linewidth',2);plot(t1,plobound.inf(3,:),'linewidth',2);
% xlabel('t','interpreter','latex','FontSize',14);ylabel('$x_3$','interpreter','latex','FontSize',14);grid;
% figure;
% plot(t1,xbound.sup(1,:),'linewidth',2);hold on; plot(t1,xbound.sup(2,:),'linewidth',2);plot(t1,xbound.sup(3,:),'linewidth',2);plot(t1,pupbound.sup(3,:),'linewidth',2); plot(t1,abs(plobound.inf(1,:)),'linewidth',2); grid;
% legend('$\overline{x}_1$ and $\underline{x}_1$','$\overline{x}_2$ and $\underline{x}_2$','$\overline{x}_3$ and $\underline{x}_3$','$\overline{p}$','$\underline{p}$','interpreter','latex'); grid on;
% set(gca,'Yscale','log');
% xlabel('$t$','interpreter','latex');
% ylabel('$|x|$','interpreter','latex');

% h1 = figure 
% subplot(6,5,[1,2,6,7]);
% figure;
% subplot(2,1,1);
% figure;
% plot(t1,xbound.inf(5,:),'linewidth',2);hold on; plot(t1,xbound.sup(5,:),'linewidth',2);plot(t1,x(:,5),'linewidth',2);
% xlabel('t','interpreter','latex','FontSize',14);ylabel('$x_5$','interpreter','latex','FontSize',14);
% %legend('$\underline{x}_5$','$\overline{x}_5$','$x_5$','interpreter','latex'); 
% grid;
% set(gca,'FontSize',20);
% % subplot(2,1,2);
% figure;
% plot(t1,xbound.inf(5,:),'linewidth',2);hold on; plot(t1,xbound.sup(5,:),'linewidth',2);plot(t1,x(:,5),'linewidth',2);
% xlabel('t','interpreter','latex','FontSize',14);ylabel('$x_5$','interpreter','latex','FontSize',14);
% legend('$\underline{x}_5$','$\overline{x}_5$','$x_5$','interpreter','latex'); grid;
% % % subplot(6,5,[11,12,16,17]);
% figure;
% plot(t1,xbound.inf(2,:),'linewidth',2);hold on; plot(t1,xbound.sup(2,:),'linewidth',2);plot(t1,x(:,2),'linewidth',2);
% xlabel('t','interpreter','latex','FontSize',14);ylabel('$x_2$','interpreter','latex','FontSize',14); grid;
%legend('$\underline{x}_2$','$\overline{x}_2$','$x_2$','interpreter','latex'); grid;
% subplot(6,5,[3,4,5,8,9,10,13,14,15]);
% figure;
% plot(t1,xbound.inf(3,:),'linewidth',2);hold on;plot(t1,xbound.sup(3,:),'linewidth',2);plot(t1,x(:,3),'linewidth',2);
% xlabel('t','interpreter','latex','FontSize',14);ylabel('$x_3$','interpreter','latex','FontSize',14);
% legend('$\underline{x}_3$','$\overline{x}_3$','$x_3$','interpreter','latex'); grid;
% % %linkaxes(ax,'x');
% % % MagInset(h1, ax ,[0.04 0.045 1 4], [0.05 0.09 5.5 9]);=
% % subplot(6,5,[18,19,20,23,24,25,28,29,30]);
% figure;
% plot(t1,xbound.inf(4,:),'linewidth',2);hold on; plot(t1,xbound.sup(4,:),'linewidth',2);plot(t1,x(:,4),'linewidth',2);
% xlabel('t','interpreter','latex','FontSize',14);ylabel('$x_4$','interpreter','latex','FontSize',14);
% legend('$\underline{x}_4$','$\overline{x}_4$','$x_4$','interpreter','latex'); grid;
% % subplot(6,5,[21,22,26,27]);

% figure;
% plot(t1,xbound.inf(3,:),'linewidth',2);hold on;plot(t1,xbound.sup(3,:),'linewidth',2);plot(t1,x(:,3),'linewidth',2);
% xlabel('t','interpreter','latex','FontSize',14);ylabel('$x_3$','interpreter','latex','FontSize',14);
% grid;
% axis([4.3 4.4 -1 -0.5]);
% 
% figure;
% plot(t1,xbound.inf(4,:),'linewidth',2);hold on;plot(t1,xbound.sup(4,:),'linewidth',2);plot(t1,x(:,4),'linewidth',2);
% xlabel('t','interpreter','latex','FontSize',14);ylabel('$x_4$','interpreter','latex','FontSize',14);
% grid;
% axis([4.1 4.2 -0.25 -0.03]);

% figure;
% subplot(2,2,1);
% plot(Ereach(1),[2 3]);hold on;plot(Ereach2(1),[2 3],'r');plot(x(1,2),x(1,3),'r*');
% title(['t = ',num2str(t1(1))])
% xlabel('x2');ylabel('x3');
% legend('Our Algorithm','Ellipsoid Only');
% subplot(2,2,2);
% plot(Ereach(25),[2 3]);hold on;plot(Ereach2(25),[2 3],'r');plot(x(25,2),x(25,3),'r*');
% title(['t = ',num2str(t1(25))])
% xlabel('x2');ylabel('x3');
% legend('Our Algorithm','Ellipsoid Only');
% subplot(2,2,3);
% plot(Ereach(50),[2 3]);hold on;plot(Ereach2(50),[2 3],'r');plot(x(50,2),x(50,3),'r*');
% title(['t = ',num2str(t1(50))])
% xlabel('x2');ylabel('x3');
% legend('Our Algorithm','Ellipsoid Only');
% subplot(2,2,4);
% plot(Ereach(100),[2 3]);hold on;plot(Ereach2(100),[2 3],'r');plot(x(100,2),x(100,3),'r*');
% title(['t = ',num2str(t1(100))])
% xlabel('x2');ylabel('x3');
% legend('Our Algorithm','Ellipsoid Only');
% figure;
% subplot(2,2,1);
% plot(Ereach(1),[1 3]);hold on;plot(Ereach2(1),[1 3],'r');plot(x(1,1),x(1,3),'r*');
% title(['t = ',num2str(t1(1))])
% xlabel('x1');ylabel('x3');
% legend('Our Algorithm','Ellipsoid Only');
% subplot(2,2,2);
% plot(Ereach(25),[1 3]);hold on;plot(Ereach2(25),[1 3],'r');plot(x(25,1),x(25,3),'r*');
% title(['t = ',num2str(t1(25))])
% xlabel('x1');ylabel('x3')
% legend('Our Algorithm','Ellipsoid Only');
% subplot(2,2,3);
% plot(Ereach(50),[1 3]);hold on;plot(Ereach2(50),[1 3],'r');plot(x(50,1),x(50,3),'r*');
% title(['t = ',num2str(t1(50))])
% xlabel('x1');ylabel('x3')
% legend('Our Algorithm','Ellipsoid Only');
% subplot(2,2,4);
% plot(Ereach(100),[1 3]);hold on;plot(Ereach2(100),[1 3],'r');plot(x(100,1),x(100,3),'r*');
% title(['t = ',num2str(t1(100))])
% xlabel('x1');ylabel('x3')
% legend('Our Algorithm','Ellipsoid Only');


% subplot(2,2,2);
% plot3(squeeze(b2(25,1,:)),squeeze(b2(25,2,:)),squeeze(b2(25,3,:)),'bo','MarkerSize',1);hold on; plot3(x(25,1),x(25,2),x(25,3),'r*');
% title(['t = ',num2str(t1(25))])
% xlabel('x1');ylabel('x2');zlabel('x3')
% subplot(2,2,3);
% plot3(squeeze(b2(50,1,:)),squeeze(b2(50,2,:)),squeeze(b2(50,3,:)),'bo','MarkerSize',1);hold on; plot3(x(50,1),x(50,2),x(50,3),'r*');
% title(['t = ',num2str(t1(50))])
% xlabel('x1');ylabel('x2');zlabel('x3')
% subplot(2,2,4);
% plot3(squeeze(b2(100,1,:)),squeeze(b2(100,2,:)),squeeze(b2(100,3,:)),'bo','MarkerSize',1);hold on; plot3(x(100,1),x(100,2),x(100,3),'r*');
% title(['t = ',num2str(t1(100))])
% xlabel('x1');ylabel('x2');zlabel('x3')
% figure;
% plot(t1,volume2);
% % Upper bound for Hausdorff distance for Mc
% % figure;
% % plot(t1(1:100),upper_bound1);
% % xlabel('t'); ylabel('Upper bound');grid on;
% % title('Upper bound for Hausdorff distance for reachable set with x(0)=0');
% % % Upper bound for Hausdorff distance for sum
% % figure;
% % plot(t1(1:100),upper_bound2);
% % xlabel('t'); ylabel('Upper bound');grid on;
% % title('Upper bound for Hausdorff distance for ellipsoidal sum');