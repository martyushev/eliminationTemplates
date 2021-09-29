folder = fileparts(which('test_num_all.m'));
load(strcat(folder, '\_results\roots_f_relpose_7p_fr.mat'));
load(strcat(folder, '\_results\roots_z_relpose_7p_fr.mat'));

bwd = 0.02;
clr1 = [1 0.3 0.3];
clr2 = [0.3 0.3 1];
hf = histogram(roots_f_relpose_7p_fr,'binwidth',bwd,'displaystyle','stairs','linewidth',1);
hf.EdgeColor = clr1;
hold on;
hz = histogram(roots_z_relpose_7p_fr,'binwidth',bwd,'displaystyle','stairs','linewidth',1);
hz.EdgeColor = clr2;
axis([-1 4 0 31]);

Vf = hf.Values;
Ef = hf.BinEdges;
[~,Lf] = findpeaks(Vf,'MinPeakHeight',12);
cf = (Ef(Lf)+Ef(Lf+1))/2;
Vz = hz.Values;
Ez = hz.BinEdges;
[~,Lz] = findpeaks(Vz,'MinPeakHeight',25);
cz = (Ez(Lz)+Ez(Lz+1))/2;
hold on
plot(cf,Vf(Lf)+1.5,'-vk','color',clr1,'markerfacecolor',clr1,'markersize',20);
hold on
plot(cz,Vz(Lz)+1.5,'-vk','color',clr2,'markerfacecolor',clr2,'markersize',20);
xlabel('real roots');
ylabel('frequency');
hold on;
h1 = plot(1:1,'color',clr1);
hold on;
h2 = plot(1:1,'color',clr2);

[~,hobj] = legend([h1,h2],{'focal length $f$','radial distortion $\lambda$'},'fontsize',28,'fontname','Times New Roman','location','northeast');
hl = findobj(hobj,'type','line');
set(hl,'linewidth',2);
ht = findobj(hobj,'type','text');
set(ht,'interpreter','latex','fontsize',28,'fontname','Times New Roman');

set(gca,'fontsize',30,'fontname','Times New Roman');
set(gcf,'PaperPositionMode','auto');
set(gcf,'PaperOrientation','landscape');
set(gcf,'PaperPosition',[1 1 28 19]);
folder = fileparts(which('test_num_all.m'));
print(gcf,'-dpdf',strcat(folder,'\_results\fig4b.pdf'));

disp([cf, cz]);