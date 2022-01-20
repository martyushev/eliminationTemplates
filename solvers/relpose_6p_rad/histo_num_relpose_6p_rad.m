folder = fileparts(which('add_all.m'));
load(strcat(folder, '\_results\Err_relpose_6p_rad.mat'));

bwd = 3e-1;
nbins = 60;
clr = [70 100 160]/255;
err = log10(Err_relpose_6p_rad);
hr1 = histogram(err,nbins,'BinWidth',bwd);
hr1.FaceColor = clr;
hr1.EdgeColor = clr;

axis([-17 1 0 1150]);

set(gca,'fontsize',54,'fontname','Times New Roman');
set(gcf,'PaperPositionMode','auto');
set(gcf,'PaperOrientation','landscape');
set(gcf,'PaperPosition',[1 1 28 19]);
print(gcf,'-dpdf',strcat(folder,'\_results\fig2-8.pdf'));