using CSV, DataFrames, Interpolations, Plots
include("readcsv.jl")
include("loop.jl")
include("visualization.jl")

function slopefunction(x)
    return 1500.0 - 500*cos(pi*x/10000)
end

m0 = 1000.0             #kg/m depth
psi0 = 0.01448606927    #kg water / kg total
T0 = 21.0               #C
xs = collect(0:50:10000)#m
hs = @. slopefunction(xs)#m

psis,Ts,ms,mws = itterate_height(m0,psi0,T0,hs)
p2 = plot(xs,hs)
p3 = plot(xs,Ts)
p1 = percipitationplot(xs,mws)

#plot(hs,@. pressure(hs))