include("../_common/header.jl")
include("inidata_num_IOD.jl")
include("coefs_IOD.jl")
include("red_481x561_IOD.jl")

function test_num_IOD()

    Random.seed!(23)
    N = 10000
    d = 66

    stats = ini_stats("IOD")

    for i in 1:N
        data = inidata_num_IOD()
        C,U = coefs_IOD(data)

        toc = @elapsed S = red_481x561_IOD(C)
        stats.tm = [stats.tm; toc]
        if isempty(S); continue; end

        stats = update_stats(stats,S,C,U,d)
    end

    disp_stats(stats)

end

test_num_IOD()