library(shiny)
library(plotly)

# UI half of the shiny application as a fluidpage for maximum flexibility
shinyUI(fluidPage( 
  
  # construct title panel
  titlePanel('Iris Data'),
  
  # construct side panel
  sidebarLayout(
    
    sidebarPanel('Use the buttons below to change the data shown in the chart.',
      
      # radio buttons allow the selection of which species of flowers to view data for                      
      radioButtons("species", label = h3("Select Species"),
                  choices = list("setosa" = 'setosa', "versicolor" = 'versicolor',
                                 "virginica" = 'virginica'),
                  selected = 'setosa'
                  ),
      
      # dropdown selection of plot colors for sepal points
      selectInput("color1", label = h3("Select Sepal Color"),
                         choices = list("red" = 'Red', "orange" = 'Orange', "yellow" = 'Yellow',
                                        "green" = 'Green', "blue" = 'Blue', "purple" = 'Purple'),
                         selected = 'Yellow'
                  ),
      
      # dropdown selection of plot colors for petal points
      selectInput("color2", label = h3("Select Petal Color"),
                  choices = list("red" = 'Red', "orange" = 'Orange', "yellow" = 'Yellow',
                                 "green" = 'Green', "blue" = 'Blue', "purple" = 'Purple'),
                  selected = 'Purple'
                  )
    ),
    
    # construct main panel that will display the bubble chart built in server.R
    mainPanel(
      plotlyOutput('plot')
    )
  )
))
