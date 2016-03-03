# load packages necessary for the application
library(shiny)
library(plotly)
library(dplyr)

shinyServer(function(input, output) {

  # make reactive dataframe with observations for the selected species
  flower_data <- reactive({
    filter(iris, iris$Species == input$species)
  })

    # create the output/rendering of the plotly object that will go to the UI 
  output$plot <- renderPlotly({
    
    # constructs the scatterplot of the sepal/petal observations for a given species  
    plot_ly(flower_data(),
            x = Sepal.Length,
            y = Sepal.Width,
            mode = 'markers',
            name = "Sepal",
            marker = list(color = input$color1) # takes input for color of sepal points
            )%>%
            add_trace(x = Petal.Length, 
                      y = Petal.Width, 
                      mode = 'markers',
                      name = "Petal",
                      marker = list(color = input$color2)) %>% #input for petal color
            layout(title = "Beautiful Flower Data", xaxis = list(title = "Length"),
                   yaxis = list(title = "Width")
    )
  })
})