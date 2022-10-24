x = seq(1,100,1)

ypois =  dpois(x, lambda = 75)
plot(x = x, y = ypois, type ="l", lwd = 2, col = plotcolors[1])

ybinom = dbinom(x, 80, 0.95)
plot(x = x, y = ybinom, type ="l", lwd = 2, col = plotcolors[2])

yunif = dunif(x, min = 40, max = 60)
plot(x = x, y = yunif, type ="l", lwd = 2, col = plotcolors[3])

ynorm = dnorm(x, mean = 50, sd = 10)
plot(x = x, y = ynorm, type ="l", lwd = 2, col = plotcolors[4])


pipets = runif(1000, 9.98,10.02)
hist_pipets = hist(pipets, breaks = seq(9.968,10.032,0.004), 
                   plot = FALSE)
pipbar = barplot(hist_pipets$counts, col = c(6,8),
        xlab = "volume of pipets (mL)", ylab = "number of pipets", 
        names.arg = format(round(hist_pipets$mids,3), nsmall = 3),
        main = "Certification of Class A 10-mL Pipettes")
x = seq(9.970, 10.030, 0.004)
min = 9.978
max = 10.024
dpip = dunif(x,min,max) * 4
points(x = pipbar, y = dpip, pch= 19)



coliforms = rpois(365, 5)
colbar = barplot(table(coliforms), col = c(6,8),
        xlab = "number of coliform colonies per 50-mL", 
        ylab = "number of days",
        main = "Daily Count of Coliform Colonies")
dcol = dpois(seq(0,length(colbar)-1),1) * 365
points(colbar,dcol, pch = 19)

cholest = rbinom(100,27,0.0111)
cholest
barplot(table(cholest), col = c(6,8),
        xlab = "number of 13-C atoms", ylab = "number of molecules",
        main = "Carbon-13 Atoms in Cholesterol")
hist(cholest, breaks = seq(0,4,1), right = FALSE)


cuxs2 = read.csv(file = "coppersulfide.csv", header = TRUE)
h = hist(cuxs2$x, breaks = seq(1.7,2.2,0.04), plot = FALSE)
d_cuxs = dnorm(h$mids, mean = mean(cuxs2$x), sd = sd(cuxs2$x)) * max(h$counts/h$density, na.rm = TRUE)
maxy = max(h$counts,d_cuxs)
hist(cuxs2$x, breaks = seq(1.7,2.2,0.04), col = c(6,8),
     xlab = " value of x", ylab = "number of samples", ylim = c(0,maxy),
     main = "Copper/Sulfur Ratio in Copper(I)Sulfide")
points(x = h$mids, y = d_cuxs, pch = 19, col = 1)
