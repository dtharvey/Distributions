# user interface for distributions

ui = navbarPage("AC 3.0: Distributions of Data",
                theme = shinytheme("journal"),
                header = tags$head(
                  tags$link(rel = "stylesheet",
                            type = "text/css",
                            href = "style.css")
                ),
                
      # open introduction tab
          tabPanel("Introduction",
                    fluidRow(
                    withMathJax(),
                      column(width = 6,
                            wellPanel(
                              class = "scrollable-well",
                              div(
                                  class = "html-fragment",
                                  includeHTML("text/introduction.html")
                      ))),
                        column(width = 6,
                              align = "center",
                              plotOutput("introplot", height = "600px")
                      ))), # close introduction tab
                
  # open first activity tab
      tabPanel("Normal Distribution",
              fluidRow(
                column(width = 6,
                      wellPanel(
                        class = "scrollable-well",
                        div(
                            class = "html-fragment",
                            includeHTML("text/activity1.html")
                ))),
                column(width = 6,
                      align = "center",
                      splitLayout(
                        sliderInput("cus_mean",
                                    "average value for x",
                                     min = 1.7, max = 2.3, 
                                     value = 2, step = 0.01,
                                     width = "200px"),
                        sliderInput("cus_sd", 
                                    "standard deviation for x",
                                    min = 0.01, max = 0.1, 
                                    value = 0.055, step = 0.001,
                                    width = "200px"),
                        downloadButton("cusdata","download data")
                          ),
                        plotOutput("activity1plot", height = "500px")
                         ))), # close first activity tab
                
  # open second activity tab
      tabPanel("Poisson Distribution",
                fluidRow(
                column(width = 6,
                      wellPanel(
                          class = "scrollable-well",
                          div(
                              class = "html-fragment",
                              includeHTML("text/activity2.html")
                 ))),
                  column(width = 6,
                        align = "center",
                        splitLayout(
                          sliderInput("lambda",
                                      "average rate: particles per 7 s", 
                                      min = 0, max = 13, 
                                      value = 13, 
                                      step = 0.1),
                          downloadButton("betadata","download data")
                                ),
                                plotOutput("activity2plot", 
                                           height = "500px")
                         ))), # close second activity tab
                
  # open third activity tab
      tabPanel("Uniform Distribution",
              fluidRow(
               column(width = 6,
                  wellPanel(
                      class = "scrollable-well",
                      div(
                          class = "html-fragment",
                          includeHTML("text/activity3.html")
                                  ))),
                         
                column(width = 6,
                      align = "center",
                      splitLayout(
                        sliderInput("bins",label = "number of bins",
                                    min = 1, max = 20, 
                                    value = 10, step= 1, 
                                    width = "400px"),
                        downloadButton("pipetdata","download data")
                                ),
                                plotOutput("activity3plot", 
                                           height = "500px"))
                )), # close third activity tab
                
  # open fourth activity tab
      tabPanel("Binomial Distribution",
              fluidRow(
              column(width = 6,
                    wellPanel(
                      class = "scrollable-well",
                      div(
                          class = "html-fragment",
                          includeHTML("text/activity4.html")
                                  ))),
                         
              column(width = 6,
                align = "center",
                  splitLayout(
                    sliderInput("size", "number of carbon atoms (n)",
                                        min = 1, max = 50, value = 25,
                                        step = 1, width = "220px"),
                    sliderInput("prob", "probability of C-13 (p)",
                                        min = 0, max = 1, value = 0.5,
                                        step = 0.001, width = "200px"),
                    downloadButton("choldata","download data")
                                ),
                                plotOutput("activity4plot", 
                                           height = "500px")
                         )
                )), # close fourth activity tab
                
  # open wrap-up tab
      tabPanel("Wrapping Up",
        fluidRow(
          column(width = 6,
            wellPanel(
                      class = "scrollable-well",
                      div(
                          class = "html-fragment",
                          includeHTML("text/wrapup.html")
                                  ))),
                         
          column(width = 6,
                  align = "center",
                    splitLayout(
                                  # inputs here
                                ),
                                plotOutput("wrapupplot1", 
                                           height = "550px")
                         )) # close wrap-up tab
                
)) # close navbarPage

