# global.r file for distribution app

# packages to load
library(shiny) # functions for creating app
library(shinythemes) # functions for styling shiny app

# set color scheme
palette("Okabe-Ito")

# data for the four distributions
cuxs = read.csv(file = "data/coppersulfide.csv", header = TRUE)
betaparticles = read.csv(file = "data/betaparticles.csv", header = TRUE)
cholesterol = read.csv(file = "data/cholesterol.csv", header = TRUE)
pipets = read.csv(file = "data/pipets.csv", header = TRUE)
