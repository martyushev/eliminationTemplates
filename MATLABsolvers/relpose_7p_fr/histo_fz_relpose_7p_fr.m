load(strcat(folder, '\_results\Err_f_relpose_7p_fr.mat'));
load(strcat(folder, '\_results\Err_z_relpose_7p_fr.mat'));
load(strcat(folder, '\_results\Err_E_relpose_7p_fr.mat'));

bwd = 3e-1;
nbins = 60;
clr1 = [1 0.3 0.3];
clr2 = [0.3 0.3 1];
clr3 = [0.6 0.6 0.6];
err_f = log10(Err_f_relpose_7p_fr);
err_z = log10(Err_z_relpose_7p_fr);
err_E = log10(Err_E_relpose_7p_fr);
hr1 = histogram(err_f,nbins,'binwidth',bwd,'displaystyle','stairs','linewidth',2);
%hr1.FaceColor = clr1;
hr1.EdgeColor = clr1;
hold on;
hr2 = histogram(err_z,nbins,'binwidth',bwd,'displaystyle','stairs','linewidth',2);
%hr2.FaceColor = clr2;
hr2.EdgeColor = clr2;
hold on;
hr3 = histogram(err_E,nbins,'binwidth',bwd,'displaystyle','stairs','linewidth',2);
%hr3.FaceColor = clr3;
hr3.EdgeColor = clr3;
hold on;
h1 = plot(1:1,'color',clr1);
hold on;
h2 = plot(1:1,'color',clr2);
hold on;
h3 = plot(1:1,'color',clr3);

[~,hobj] = legend([h1,h2,h3],{'focal length $f$','radial distortion $\lambda$','essential matrix $E$'},'fontsize',28,'fontname','Times New Roman','location','northeast');
hl = findobj(hobj,'type','line');
set(hl,'linewidth',2);
ht = findobj(hobj,'type','text');
set(ht,'interpreter','latex','fontsize',28,'fontname','Times New Roman');

axis([-15 1 0 700]);
xlabel('$\log_{10}$ of relative error','interpreter','latex');
ylabel('frequency');

set(gca,'fontsize',30,'fontname','Times New Roman');
set(gcf,'PaperPositionMode','auto');
set(gcf,'PaperOrientation','landscape');
set(gcf,'PaperPosition',[1 1 28 19]);
print(gcf,'-dpdf',strcat(folder,'\_results\fig3a.pdf'));