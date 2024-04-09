gamma = 1.4

function itterate_height(m0,psi0,T0,hs)
    ms = [m0]
    psis = [psi0]
    Ts = [T0]
    Ps = [pressure(hs[1])]
    mws = []
    for n = 1:1:(length(hs)-1)
        push!(Ps,pressure(hs[n+1])) 
        push!(Ts,((Ts[end]+273.15)*(Ps[end-1]/Ps[end])^((1-gamma)/gamma))-273.15)
        psisat = massfraction(Ts[end])
        if psisat >= psis[end]
            push!(psis,psis[end])
            push!(ms,ms[end])
            push!(mws,0.0)
        else
            push!(psis,psisat)
            push!(ms,ms[end]*(psis[end-1]-1)/(psisat-1))
            push!(mws,ms[end-1]-ms[end])
        end
    end
    return psis,Ts,ms,mws
end