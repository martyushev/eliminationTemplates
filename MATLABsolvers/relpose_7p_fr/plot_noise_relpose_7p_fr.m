load(strcat(folder, '\_results\q1_f_relpose_7p_fr.mat'));
load(strcat(folder, '\_results\q1_z_relpose_7p_fr.mat'));
load(strcat(folder, '\_results\q1_E_relpose_7p_fr.mat'));

lev = 0:0.1:1;
h1 = plot(lev,q1_f_relpose_7p_fr,'-o','color',[1 0.3 0.3],'linewidth',2);
hold on
h2 = plot(lev,q1_z_relpose_7p_fr,'-s','color',[0.3 0.3 1],'linewidth',2);
hold on
h3 = plot(lev,q1_E_relpose_7p_fr,'-d','color',[0.6 0.6 0.6],'linewidth',2);

[~,hobj] = legend([h1,h2,h3],{'focal length $f$','radial distortion $\lambda$','essential matrix $E$'},'fontsize',28,'fontname','Times New Roman','location','northwest');
hl = findobj(hobj,'type','line');
set(hl,'linewidth',2);
ht = findobj(hobj,'type','text');
set(ht,'interpreter','latex','fontsize',28,'fontname','Times New Roman');

axis([0 1 0 1.7]);
xlabel('pixels');
ylabel('relative error');
xticks([0 0.2 0.4 0.6 0.8 1]);
xticklabels({'0' '0.2' '0.4' '0.6' '0.8' '1'});

set(gca,'fontsize',30,'fontname','Times New Roman');
set(gcf,'PaperPositionMode','auto');
set(gcf,'PaperOrientation','landscape');
set(gcf,'PaperPosition',[1 1 28 19]);
print(gcf,'-dpdf',strcat(folder,'\_results\fig3b.pdf'));