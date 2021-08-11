load(strcat(folder, '\_results\Err_pose_35pt.mat'));

%bwd = 3e-1;
%nbins = 60;
err = log10(Err_pose_35pt);
hr1 = histogram(err,nbins,'BinWidth',bwd);%,'DisplayStyle','stairs','LineWidth',1
hr1.FaceColor = clr;
hr1.EdgeColor = clr;

axis(axs);

set(gca,'fontsize',fs,'fontname','Times New Roman');
set(gcf,'PaperPositionMode','auto');
set(gcf,'PaperOrientation','landscape');
set(gcf,'PaperPosition', [1 1 28 19]);
print(gcf, '-dpdf', strcat(folder, '\_results\fig2-23.pdf'));