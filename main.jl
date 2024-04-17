using CSV, DataFrames, Interpolations, Plots
include("readcsv.jl")
include("loop.jl")
include("visualization.jl")

function cosslopefunction(x)
    return 1500.0 - 500*cos(pi*x/10000)
end
function logslopefunction(x)
    N = 1920.24-1249.68
    P = 0.75
    k = 0.0000015
    temp1 = (N-P)/P
    temp2 = exp(-N*x*k)
    return N/(temp1*temp2 + 1) + 1249.68
end

m0 = 1000.0             #kg/m depth
psi0 = 0.01448606927    #kg water / kg total
T0 = 16.85              #C
xs = collect(0:50:10000)#m
hs = @. logslopefunction(xs)#m

psis,Ts,ms,mws = itterate_height(m0,psi0,T0,hs)
mdryairs = @. (1.0 - psis)*ms
p1 = plot(xs,hs)
p2 = plot(xs,Ts)
p3 = percipitationplot(xs,mws)
p4 = percipitationplot2(xs,mdryairs,mws)

#plot(hs,@. pressure(hs))