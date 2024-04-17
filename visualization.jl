function percipitationplot(xs,mws)
    pointsx = [0.0]
    pointsy = [0.0]
    for i = 1:1:length(mws)
        dist = xs[i+1] - xs[i]
        push!(pointsx,xs[i])
        push!(pointsx,xs[i+1])
        push!(pointsy,mws[i]/dist)
        push!(pointsy,mws[i]/dist)
    end
    push!(pointsx,xs[end])
    push!(pointsy,0.0)
    return plot(pointsx,pointsy, seriestype = :shape,xlabel = "Horizontal Distance (m)",ylabel = "Percipitation (kg/m^2)")
end

function percipitationplot2(xs,mdryairs,mws)
    pointsx = [0.0]
    pointsy = [0.0]
    totalpercipitation = 0.0
    for i = 1:1:length(mws)
        #dist = xs[i+1] - xs[i]
        totalpercipitation = totalpercipitation + mws[i]
        push!(pointsx,xs[i])
        push!(pointsx,xs[i+1])
        push!(pointsy,totalpercipitation/mdryairs[i])
        push!(pointsy,totalpercipitation/mdryairs[i])
    end
    push!(pointsx,xs[end])
    push!(pointsy,0.0)
    return plot(pointsx,pointsy, seriestype = :shape,xlabel = "Horizontal Distance (m)",ylabel = "Accumulated Percipitation (kg/kg)")
end