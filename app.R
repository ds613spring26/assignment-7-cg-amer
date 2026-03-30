# Global variables can go here
n <- 200


# Define the UI
ui <- bootstrapPage(
  titlePanel("Clesean Glover"),
  sidebarLayout(
    sidebarPanel(
      selectInput("PlotType", "Select a plottype:",
                  choices = c("Boxplot", "Histogram")),
      numericInput('n', 'Number of obs', n),
      radioButtons("colors", "Choose a color?",
                   choices = c("green", "red", "blue", "yellow")),
      plotOutput('plot')
  ),
  
  mainPanel(
      plotOutput('distPlot')
      )
    )
  )

  



# Define the server code
server <- function(input, output) {
  output$distPlot <- renderPlot({
    
    if (input$PlotType == "Histogram") {
      hist(runif(input$n), col = input$colors)
    } else {
      boxplot(runif(input$n), col = input$colors)
    }
})
    
}    


# Return a Shiny app object
  
shinyApp(ui = ui, server = server)