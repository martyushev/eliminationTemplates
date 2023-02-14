folder = fileparts(which('add_all.m'));
load(strcat(folder, '\_results\stats_3v_triang_laurent_feas.mat'));

bwd = 0.3;
nbins = 60;
clr1 = [1 0.3 0.3];
clr2 = [0.3 1 1];
reprerr = log10(stats.reprerr);
relerr = log10(stats.relerr);
[f1,xi1] = ksdensity(reprerr);
[f2,xi2] = ksdensity(relerr);
h1 = plot(xi1,f1,'color',clr1,'linewidth',2);
hold on;
h2 = plot(xi2,f2,'color',clr2,'linewidth',2);

[~,hobj] = legend([h1,h2],{'repr. error','rel. error'},'fontsize',28,'location','northeast');
hl = findobj(hobj,'type','line');
set(hl,'linewidth',3);
ht = findobj(hobj,'type','text');
set(ht,'interpreter','latex','fontsize',28);

axis([-15 1 0 0.28]);
%xlabel('$\log_{10}$ of reprojection error','interpreter','latex');
%ylabel('frequency');

set(gca,'fontsize',30);
set(gcf,'PaperPositionMode','auto');
set(gcf,'PaperOrientation','landscape');
set(gcf,'PaperPosition',[1 1 28 19]);
print(gcf,'-dpdf',strcat(folder,'\_results\fig.pdf'));