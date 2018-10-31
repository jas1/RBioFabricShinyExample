library(htmlwidgets)
devtools::install_github("jas1/RBioFabric")
library(igraph)
library(igraphdata)
library(RBioFabric)
library(shiny)


data("karate")

# Define UI for app that draws a biofabric ----
ui <- fluidPage(
    
    # App title ----
    titlePanel("Hello Biofabric!"),
    
    
    p("sample shinyApp to check if it deploys to shinyapps.io"),
    p("source at: "),
    a(href="https://github.com/jas1/RBioFabricShinyExample","github:RBioFabricShinyExample"),
    
    fluidRow(
        column(width = 12, 
               # Output: biofabric ----
               bioFabric_htmlwidgetOutput("output_biofabric_net",
                                          width = "100%", 
                                          height = "500px") )
    )
)

# server side
server <- function(input, output,session) {

    # defining biofabric output
    output$output_biofabric_net <- renderBioFabric_htmlwidget({
            graph_data <- karate
            bioFabric_htmlwidget( bioFabric(graph_data),height = 500 )
        })
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)