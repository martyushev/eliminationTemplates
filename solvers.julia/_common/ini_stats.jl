# initialize solver statistics

mutable struct Stats
    const name::String         # problem name
    tm::Vector{Float64}        # timing
    err::Vector{Float64}       # numerical error
    flr::Vector{Float64}       # failure
    shrp::Vector{Float64}      # boundary sharpness
    k::Vector{Int}             # number of roots
    kr::Vector{Int}            # number of real roots
end

function ini_stats(prob)

    stats = Stats(prob, [], [], [], [], [], []);
    return stats;

end