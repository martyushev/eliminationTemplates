folder = fileparts(which('test_num_all.m'));
load(strcat(folder, '\_results\Err_noise_f_relpose_7p_fr.mat'));
load(strcat(folder, '\_results\Err_noise_z_relpose_7p_fr.mat'));

q_f = arrayfun(@(x) quantile(Err_noise_f_relpose_7p_fr{x},0.25), 1:11);
q_z = arrayfun(@(x) quantile(Err_noise_z_relpose_7p_fr{x},0.25), 1:11);

lev = 0:0.1:1;
h1 = plot(lev,q_f,'-o','color',[1 0.3 0.3],'linewidth',2,'MarkerSize',15);
hold on
h2 = plot(lev,q_z,'-s','color',[0.3 0.3 1],'linewidth',2,'MarkerSize',15);

%nx = 11;
%nd = 800;
%y = zeros(nx,1,nd);
%z = zeros(nx,1,nd);
%ylim([0 2]); 
%for j = 1:11
%    y(j,1,:) = log10(Err_f_relpose_7p_fr{j}(1:nd));
%    z(j,1,:) = log10(Err_z_relpose_7p_fr{j}(1:nd));
%end
%boxplot2(y,lev);
%hold on
%boxplot2(z,lev);

[~,hobj] = legend([h1,h2],{'focal length $f$','radial distortion $\lambda$'},'fontsize',28,'fontname','Times New Roman','location','northwest');
hl = findobj(hobj,'type','line');
set(hl,'linewidth',2);
ht = findobj(hobj,'type','text');
set(ht,'interpreter','latex','fontsize',28,'fontname','Times New Roman');

axis([0 1 0 0.16]);
xlabel('pixels');
ylabel('relative error');
xticks([0 0.2 0.4 0.6 0.8 1]);
xticklabels({'0' '0.2' '0.4' '0.6' '0.8' '1'});

set(gca,'fontsize',30,'fontname','Times New Roman');
set(gcf,'PaperPositionMode','auto');
set(gcf,'PaperOrientation','landscape');
set(gcf,'PaperPosition',[1 1 28 19]);
print(gcf,'-dpdf',strcat(folder,'\_results\fig3b.pdf'));