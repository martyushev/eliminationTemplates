% generate ground truth projective matrices Pgt and essential matrices Egt
function [Pgt,Egt] = synth_cameras(nv,Kgt)

    axs = 2*rand(3,nv)-ones(3,nv); % rotation axes
    ang = (30-10)*rand(nv,1)+10; % uniformly distributed rotation angles (in degrees)

    Pgt = cell([1,nv]);
    Egt = cell([nv,nv]);
    R = cell([1,nv]);
    t = cell([1,nv]);

    for i = 1:nv
        if i == 1
            cntr = zeros(3,1);
            R{i} = eye(3);
        else
            cntr = 2*rand(3,1)-ones(3,1); % camera center
            cntr = cntr/norm(cntr,'fro');
            R{i} = rotRodrigues(ang(i),axs(:,i));
        end
        t{i} = -R{i}*cntr;
        Pgt{i} = Kgt{i}*[R{i} t{i}];
    end

    % essential matrices
    for i = 1:nv
        for j = i+1:nv
            Egt{i,j} = R{i}*skew(R{i}.'*t{i} - R{j}.'*t{j})*R{j}.';
        end
    end

end
