library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict Fertility from SocioEconomic Indicators"),
  sidebarLayout(
    sidebarPanel(
      h3("Choose Value of Predictors"),
      sliderInput("sliderEducation", "Percent Educated", 5, 80, value = 63),
      sliderInput("sliderAgri", "Percent Agriculture", 5, 100, value = 63),
      checkboxInput("showModel1", "Show/Hide Fertility vs Education Model", value = TRUE),
      checkboxInput("showModel2", "Show/Hide Fertility vs Education + Agriculture Model", value = TRUE),
      submitButton("Submit")
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Fertility from Education Data:"),
      textOutput("pred1"),
      plotOutput("plot2"),
      h3("Predicted Fertility from Education + Agriculture Data:"),
      textOutput("pred2")
    )
  )
))