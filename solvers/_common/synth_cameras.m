% ground truth projective matrices Pgt, fundamental matrices Fgt and essential matrices Egt
function [Pgt,Fgt,Egt] = synth_cameras(nv,Kgt)

    base = 0.3; % baselength
    axs = 2*rand(3,nv)-ones(3,nv); % rotation axes
    ang = (30-10)*rand(nv,1)+10; % uniformly distributed rotation angles (in degrees)

    Pgt = cell([1,nv]);
    Fgt = cell([nv,nv]);
    Egt = cell([nv,nv]);
    R = cell([1,nv]);
    t = cell([1,nv]);

    for i = 1:nv
        if i == 1
            cntr = zeros(3,1);
            R{i} = eye(3);
        else
            cntr = 2*rand(3,1)-ones(3,1); % camera center
            cntr = base*cntr/norm(cntr,'fro');
            R{i} = rotRodrigues(ang(i),axs(:,i));
        end
        t{i} = -R{i}*cntr; % translations
        Pgt{i} = Kgt{i}*[R{i} t{i}];
    end

    % essential and fundamental matrices
    for i = 1:nv
        for j = i+1:nv
            Egt{i,j} = R{i}*skew(R{i}.'*t{i} - R{j}.'*t{j})*R{j}.';
            Fgt{i,j} = (Kgt{i}.')\Egt{i,j}/Kgt{j};
        end
    end

end