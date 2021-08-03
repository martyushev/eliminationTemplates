load('d:\CurrentWork\paper13\programs\matlab\GBsparseLA\solvers\_results\Err_f_relpose_7p_fr.mat')
load('d:\CurrentWork\paper13\programs\matlab\GBsparseLA\solvers\_results\Err_z_relpose_7p_fr.mat')

bwd = 1e-1;
nbins = 150;
logerr_f = log10(Err_f_relpose_7p_fr);
logerr_z = log10(Err_z_relpose_7p_fr);
hr1 = histogram(logerr_f,nbins,'DisplayStyle','stairs','LineWidth',1);%,'BinWidth',bwd
hr1.EdgeColor = [0.3 1 0.3];
hr1.Annotation.LegendInformation.IconDisplayStyle = 'off';
hold on;
hr2 = histogram(logerr_z,nbins,'DisplayStyle','stairs','LineWidth',1);%,'BinWidth',bwd
hr2.EdgeColor = [0.3 0.3 1];
hr2.Annotation.LegendInformation.IconDisplayStyle = 'off';

hold on;
%plot(2:3,'color',[0.3 1 0.3]);
axis([-12 1 0 160]);

[hobj1,hobj,~,~] = legend({'f'},'fontsize',32,'fontname','Times New Roman');
hl = findobj(hobj,'type','line');
set(hl,'LineWidth',1);
ht = findobj(hobj,'type','text');
set(ht,'Interpreter','latex','fontsize',32,'fontname','Times New Roman');
set(gca,'fontsize',32,'fontname','Times New Roman');
set(hobj1,'position',[0.57 0.65 0.4 0.2]);
set(gcf,'PaperPositionMode','auto');
set(gcf,'PaperOrientation','landscape');
set(gcf,'PaperPosition', [1 1 28 19]);
print(gcf, '-dpdf', 'd:\CurrentWork\paper13\programs\matlab\GBsparseLA\solvers\relpose_7p_fr\fig.pdf');