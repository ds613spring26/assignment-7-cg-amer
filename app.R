# Global variables can go here
n <- 200


# Define the UI
ui <- bootstrapPage(
  titlePanel("Clesean Glover"),
  numericInput('n', 'Number of obs', n),
  plotOutput('Boxplot')
)


# Define the server code
server <- function(input, output) {
  output$Boxplot <- renderPlot({
    boxplot(runif(input$n), col = 'green')
            })
}

# Return a Shiny app object
shinyApp(ui = ui, server = server)