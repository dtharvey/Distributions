# user interface for distributions

library(shiny)
library(shinythemes)

ui = navbarPage("AC 3.0: Distributions of Data",
                theme = shinytheme("journal"),
                tags$head(
                  tags$link(rel = "stylesheet",
                            type = "text/css",
                            href = "style.css")
                ),
                # open first tab
                tabPanel("Introduction",
                 fluidRow(
                  column(width = 6,
                   wellPanel(
                     includeHTML("introduction.html")
                )
                ),
                  column(width = 6,
                    align = "center",
                    plotOutput("introplot", height = "700px")
                )
                )
                ), # close first tab
                
                tabPanel("Copper/Sulfur Ratio",
                  column(width = 6,
                    wellPanel(
                      includeHTML("activity1.html")
                )     
                ),
                
                  column(width = 6,
                         align = "center",
                    splitLayout(
                      sliderInput("cus_mean",
                                "average value for x",
                                min = 1.7, max = 2.3, 
                                value = 2, step = 0.01,
                                width = "200px"),
                      sliderInput("cus_sd", "standard deviation for x",
                                  min = 0.01, max = 0.1, 
                                  value = 0.055, step = 0.001,
                                  width = "200px"),
                      downloadButton("cusdata","download data")
                ),
                      plotOutput("activity1plot", height = "600px")
                )
                ),
                tabPanel("Beta Emission",
                  column(width = 6,
                    wellPanel(
                      includeHTML("activity2.html")
                )     
                ),
                         
                 column(width = 6,
                  align = "center",
                   splitLayout(
                  sliderInput("lambda","average rate: particles per 7 s",
                                  min = 0, max = 13, value = 13, step = 0.1)
                                ),
                                plotOutput("activity2plot", height = "600px")
                )
                ),
                tabPanel("Pipettes",
                  column(width = 6,
                    wellPanel(
                              includeHTML("activity3.html")
                )     
                ),
                         
                   column(width = 6,
                    align = "center",
                      splitLayout(
                       sliderInput("pip", 
                                   label=div(HTML("log(±Delta)")),
                                   min = -3, max = 0, 
                                   value = -1.699, 
                                   step = 0.001),
                       checkboxInput(inputId = "indpoints", 
                                     label = "show individual pipettes",
                                     value = FALSE)
                              ),
                                plotOutput("activity3plot", height = "600px")
                         )
                ),
                
                tabPanel("Cholesterol",
                  column(width = 6,
                    wellPanel(
                               includeHTML("activity4.html")
                                )     
                         ),
                         
                  column(width = 6,
                         align = "center",
                    splitLayout(
                                sliderInput("size","number of carbon atoms (n)",
                                            min = 1, max = 50, value = 25,
                                            step = 1),
                                sliderInput("prob","probability of C-13 (p)",
                                            min = 0, max = 1, value = 0.5,
                                            step = 0.001)
                                ),
                                plotOutput("activity4plot", height = "600px")
                         )
                ),
                tabPanel("Wrapping Up",
                         column(width = 6,
                                wellPanel(
                                  includeHTML("wrapup.html")
                                )     
                         ),
                         
                         column(width = 6,
                                align = "center",
                                splitLayout(
                                  # inputs here
                                ),
                                plotOutput("wrapupplot1", height = "600px")
                         )
                )
                
  ) # close navbarPage

