% rotation matrix by Rodrigues' formula
function R = rotRodrigues(ang,axs)
    r = axs./norm(axs,'fro');
    R = cosd(ang)*eye(3)+(1-cosd(ang))*(r*r.')-sind(ang)*skew(r);
end
