
pressuretable = CSV.File("Tabulated Data/pressure.csv", header = false)
heights = zeros(pressuretable.rows)
pressures = zeros(pressuretable.rows)
for i = 1:1:pressuretable.rows
    heights[i] =pressuretable[i][1]
    pressures[i] =pressuretable[i][2]
end
pressure = linear_interpolation(heights,pressures)

watertable = CSV.File("Tabulated Data/water.csv", header = false)
temps = zeros(watertable.rows)
massfractions = zeros(watertable.rows)
for i = 1:1:watertable.rows
    temps[i] =watertable[i][1]
    massfractions[i] =watertable[i][4]
end
massfraction = linear_interpolation(temps,massfractions)