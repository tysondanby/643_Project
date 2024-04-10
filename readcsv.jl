
pressuretable = CSV.File("Tabulated Data/pressure.csv", header = false)
heights = zeros(pressuretable.rows)
pressures = zeros(pressuretable.rows)
for i = 1:1:pressuretable.rows
    heights[i] =pressuretable[i][1]
    pressures[i] =pressuretable[i][2]
end
pressureinterp = interpolate(pressures, BSpline(Cubic()))#linear_interpolation(heights,pressures)
function pressure(height)
    function test(y)
        return y > height
    end
    index = findfirst(test,heights)
    distance =  heights[index] - heights[index-1]
    numerator = height - heights[index-1]
    return pressureinterp(index + numerator/distance - 1.0)
end

watertable = CSV.File("Tabulated Data/water.csv", header = false)
temps = zeros(watertable.rows)
massfractions = zeros(watertable.rows)
for i = 1:1:watertable.rows
    temps[i] =watertable[i][1]
    massfractions[i] =watertable[i][4]
end
#massfraction = linear_interpolation(temps,massfractions)
massfractioninterp = interpolate(massfractions, BSpline(Cubic()))

function massfraction(temperature)
    function test(y)
        return y > temperature
    end
    index = findfirst(test,temps)
    distance =  temps[index] - temps[index-1]
    numerator = temperature - temps[index-1]
    return massfractioninterp(index + numerator/distance - 1.0)
end