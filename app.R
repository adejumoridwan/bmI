library(shiny)

ui <- fluidPage(
  pageWithSidebar(
    headerPanel("BMI Calculator (Body Mass Index)"),
    sidebarPanel(
      sliderInput("ht","Enter your Height in Inches",70, min = 50, max = 80,step = 1),
      numericInput("wt","Enter your Weight in Kilograms", 50, min = 40, max = 100, step = 1)
    ),
    mainPanel(
      h3("Results"),
      h4("Your height is:"),
      verbatimTextOutput("oht"),
      h4("Your weight is:"),
      verbatimTextOutput("owt"),
      h4("Your BMI is:"),
      verbatimTextOutput("bmi_value")
    )
  )
)

BMI <- function(height, weight){
  return(weight/(0.0254*height)^2)
}


server <- function(input, output, session) {
  output$oht <- renderPrint({input$ht})
  output$owt <- renderPrint({input$wt})
  output$bmi_value <- renderPrint({BMI(input$ht, input$wt)})
}

shinyApp(ui, server)