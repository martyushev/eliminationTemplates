rng(23);
N = 1;
d = 64;

stats = ini_stats('gen6p');

for i = 1:N

    data = inidata_num_gen6p();
    [C,U,dU] = coefs_gen6p(data);

    tic;
    S = red_78x155_gen6p(C);
    stats.tm = [stats.tm toc];
    if isempty(S); continue; end
    
    for k = 1:size(S,2)
        %Rt = getRt6p_gen(data,S(:,k));
        %if norm(Rt-Rtgt,'fro')<1e-5
        %    disp(S(:,k));
        %end
        %disp(S(1,k));
    end

    [stats,~] = update_stats(stats,S,C,U,dU,d,'iterRef',0);

end

disp_stats(stats,'plotHist',1,'saveHist',1);