include("../_common/header.jl")
include("inidata_num_3v_triang_laurent.jl")
include("coefs_3v_triang_laurent.jl")
include("red_69x127_3v_triang_laurent.jl")

function test_num_3v_triang_laurent()

    Random.seed!(23)
    N = 10000
    d = 47

    stats = ini_stats("3v_triang_laurent")

    for i in 1:N
        data = inidata_num_3v_triang_laurent()
        C,U = coefs_3v_triang_laurent(data)

        toc = @elapsed S = red_69x127_3v_triang_laurent(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_3v_triang_laurent()