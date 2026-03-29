# Global variables can go here
n <- 200


# Define the UI
ui <- bootstrapPage(
  titlePanel("Clesean Glover"),
  numericInput('n', 'Number of obs', n),
  radioButtons("colors", "Choose a color?",
      choices = c("green", "red", "blue", "yellow")),
  plotOutput('plot')
)


# Define the server code
server <- function(input, output) {
  output$plot <- renderPlot({
    boxplot(runif(input$n), col = input$colors)
            })
}

# Return a Shiny app object
shinyApp(ui = ui, server = server)