include("../_common/header.jl")
include("inidata_num_3pra_st0.jl")
include("coefs_3pra_st0.jl")
include("red_12x25_3pra_st0.jl")

function test_num_3pra_st0()

    Random.seed!(23)
    N = 10000
    d = 12

    stats = ini_stats("3pra_st0")

    for i in 1:N
        data = inidata_num_3pra_st0()
        C,U = coefs_3pra_st0(data)

        toc = @elapsed S = red_12x25_3pra_st0(C,data[3][1]^2-1)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_3pra_st0()