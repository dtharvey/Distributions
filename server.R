# server for distribution app

library(shiny)
library(shinythemes)

# place files needed by app here

cuxs = read.csv(file = "data/coppersulfide.csv", header = TRUE)
betaparticles = read.csv(file = "data/betaparticles.csv", header = TRUE)
cholesterol = read.csv(file = "data/cholesterol.csv", header = TRUE)
pipets = read.csv(file = "data/pipets.csv", header = TRUE)

# set colors

palette("Okabe-Ito")

shinyServer(function(input,output,session){
  
  # output for introduction
  
  output$introplot = renderPlot({
    set.seed(2009)
    old.par = par(mfrow = c(2,2), lwd = 3)
    
    hist(cuxs$x, breaks = seq(1.7,2.2,0.015), col = 8, border = 1,
         xlab = " value of x", ylab = "number of samples",
         main = "Copper/Sulfur Ratio in Copper Sulfide")
    
    barplot(height = betaparticles$y, col = 8, border = 1,
            ylab = "number of intervals", 
            names.arg = format(betaparticles$x, nsmall = 2), las = 0,
            xlab = "number of beta particles emittted", 
            main = "Emission of Beta Particles From Potassium-40")
    
    hist(pipets$x, breaks = seq(9.968,10.032,0.004), 
         col = 8, border = 1,
         xlab = "volume of pipet (mL)", ylab = "number of pipets",
         main = "Certification of Class A 10-mL Pipettes")
    
    barplot(height = cholesterol$y, col = 8, border = 1,
            names.arg = format(cholesterol$x, nsmall = 2), las = 0,
            xlab = "number of C-13 atoms in molecule", 
            ylab = "number of molecules",
            main = "Number of Carbon-13 Atoms in Cholesterol")
    
    par(old.par)
    
  })
  
  output$activity1plot = renderPlot({
    
    old.par = par(lwd = 3)
    h = hist(cuxs$x, breaks = seq(1.7,2.2,0.015), plot = FALSE)
    xlines = seq(1.7,2.2,0.001)
    ylines = dnorm(xlines, 
                   mean = input$cus_mean, 
                   sd = input$cus_sd) * diff(h$mids[1:2]*length(cuxs$x))
    maxy = max(h$counts,ylines)
    hist(cuxs$x, breaks = seq(1.7,2.2,0.015), col = 8, border = 1,
         xlab = " value of x", ylab = "number of samples", ylim = c(0,maxy),
         main = "Copper/Sulfur Ratio in Copper Sulfide")
    lines(x = xlines, y = ylines, col = 1, lwd = 3, lty = 2)
    par(old.par)
    
  })
  
  output$cusdata = downloadHandler(
    filename = "cuxsresults.csv",
    content = function(file){
      write.csv(cuxs$x,file)
    })
  
  output$activity2plot = renderPlot({
    old.par = par(lwd = 3)
    beta_bar = barplot(height = betaparticles$y, col = 8, border = 1,
                       plot = FALSE)
    ypoints = dpois(seq(0,length(beta_bar)-1), input$lambda) * 365
    ymax = max(betaparticles$y,ypoints)
    beta_bar = barplot(height = betaparticles$y, col = 8, border = 1,
                       ylim = c(0,1.1*ymax),
                      names.arg = format(betaparticles$x, nsmall = 2), las = 0,
                      ylab = "number of intevals",
                      xlab = "number of beta particles emitted",
                      main = "Emission of Beta Particles From Potassium-40")
    lines(x = beta_bar, y = ypoints, type = "b", pch = 19, cex = 1.25, col = 1)
    par(old.par)
  })
  
  output$betadata = downloadHandler(
    filename = "beta_particles.csv",
    content = function(file){
      write.csv(rep(betaparticles$x, betaparticles$y),file)
    })
  
  output$activity3plot = renderPlot({
    old.par = par(lwd = 3)
    hist(pipets$x, breaks = seq(9.98,10.02, 0.04/input$bins),
         col = 8, border = 1, labels = TRUE,
         xlab = "volume of pipet (mL)", ylab = "number of pipets",
         main = "Certification of Class A 10-mL Pipettes")
    par(old.par)
  })
  
  output$pipetdata = downloadHandler(
    filename = "pipetes.csv",
    content = function(file){
      write.csv(pipets$x,file)
    })
  
  output$activity4plot = renderPlot({
    old.par = par(lwd = 3)
    chol_bar = barplot(height = cholesterol$y, 
                       col = 8, border = 1, plot = FALSE)
    ypoints = dbinom(x = seq(0,length(chol_bar)-1), 
                    size = input$size, 
                    prob = input$prob) * 100
    # ymax = max(cholesterol$y,ypoints)
    chol_bar = barplot(height = cholesterol$y, col = 8, border = 1, 
                       ylim = c(0,100), 
                      names.arg = format(cholesterol$x, nsmall = 2), las = 0,
                      ylab = "number of molecules",
                      xlab = "number of Carbon-13 atoms",
                      main = "Number of Carbon-13 Atoms in Cholesterol")
    points(x = chol_bar, y = ypoints, pch = 19, cex = 1.25, col = 1)
    par(old.par)
  })
  
  output$choldata = downloadHandler(
    filename = "cholesterol.csv",
    content = function(file){
      write.csv(rep(cholesterol$x, cholesterol$y),file)})
  
  output$wrapupplot1 = renderPlot({
    
  set.seed(13)
  old.par = par(lwd = 3)
  times = rexp(365,5/7)
  thist = hist(times, breaks = seq(0,15,1), col = 8, border = 1,
       xlab = "time to next emitted particle", ylab = "frequency",
       main = "Frequency of Times Between Emission of Beta Particles")
  xlines = seq(0,15,0.01)
  ylines = dexp(xlines, rate = 5/7) * diff(thist$mids[1:2]*length(times))  
  lines(x = xlines, y = ylines, col = 1, lwd = 3, lty = 2)
  par(old.par)
  })
  
  
}) # close the server
