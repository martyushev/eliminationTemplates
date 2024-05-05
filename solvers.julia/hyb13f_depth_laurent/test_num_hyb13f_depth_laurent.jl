include("../_common/header.jl")
include("inidata_num_hyb13f_depth_laurent.jl")
include("coefs_hyb13f_depth_laurent.jl")
include("red_115x134_colpiv_hyb13f_depth_laurent.jl")

function test_num_hyb13f_depth_laurent()

    Random.seed!(23)
    N = 10000
    d = 12

    stats = ini_stats("hyb13f_depth_laurent")

    for i in 1:N
        data = inidata_num_hyb13f_depth_laurent()
        C,U = coefs_hyb13f_depth_laurent(data)

        toc = @elapsed S = red_115x134_colpiv_hyb13f_depth_laurent(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_hyb13f_depth_laurent()