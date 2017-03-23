library(shiny)
shinyServer(function(input, output) {
  model1 <- lm(Fertility ~ Education, data = swiss)
  model2 <- lm(Fertility ~ Education + Agriculture, data=swiss)

  
  model1pred <- reactive({
    edInput <- input$sliderEducation
    predict(model1, newdata = data.frame(Education = edInput))
  })
  
  model2pred <- reactive({
    agInput <- input$sliderAgri
    edInput <- input$sliderEducation
    predict(model2, newdata = data.frame(Agriculture=agInput,Education=edInput))
  })
  
  
  output$plot1 <- renderPlot({
    plot(swiss$Fertility, swiss$Education, xlab = "Education (%)", 
         ylab = "Fertility (lg)")
    if(input$showModel1){
      abline(model1, col = "red", lwd = 2)
    }
    if(input$showModel2){
      abline(model2, col = "blue", lwd = 2)
    }
  })
  
  output$plot2 <- renderPlot({
    plot(swiss$Fertility, swiss$Agriculture, xlab = "Agriculture (%)", 
         ylab = "Fertility (lg)")
    if(input$showModel1){
      abline(model1, col = "red", lwd = 2)
    }
    if(input$showModel2){
      abline(model2, col = "blue", lwd = 2)
    }
  })

  output$pred1 <- renderText({
    model1pred()
  })
  output$pred2 <- renderText({
    model2pred()
  })

})