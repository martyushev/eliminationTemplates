folder = fileparts(which('add_all.m'));
load(strcat(folder, '\_results\stats_toa_46.mat'));

bwd = 0.3;
nbins = 60;
clr = [70 100 160]/255;
err = log10(stats.maxe);
hr1 = histogram(err,nbins,'BinWidth',bwd);
hr1.FaceColor = clr;
hr1.EdgeColor = clr;

axis([-17 1 0 1150]);

set(gca,'FontSize',54,'FontName','Times New Roman');
set(gcf,'PaperPositionMode','auto');
set(gcf,'PaperOrientation','landscape');
set(gcf,'PaperPosition',[1 1 28 19]);
print(gcf,'-dpdf',strcat(folder,'\_results\histo_toa_46.pdf'));