% plot histogram and save it to a pdf-file
function plot_histo_num(stats)
    bwd = 0.3;
    nbins = 60;
    clr = [70 100 160]/255;
    err = stats.err;
    hr1 = histogram(err,nbins,'BinWidth',bwd);
    hr1.FaceColor = clr;
    hr1.EdgeColor = clr;
    axis([-17 1 0 stats.N/9]);
    set(gca,'FontSize',54,'FontName','Times New Roman');
    set(gcf,'PaperPositionMode','auto');
    set(gcf,'PaperOrientation','landscape');
    set(gcf,'PaperPosition',[1 1 28 19]);
    folder = fileparts(which('add_all.m'));
    print(gcf,'-dpdf',strcat(folder,'\_results\histo_num_', stats.problem, '.pdf'));
end