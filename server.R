library(shiny)
library(car)    # Import library to use recode() function

shinyServer(function(input, output) {
  
  values <- reactiveValues()
  
  # Calculate the interest and amount    
  observe({
    input$action_Calc
    values$bmi <- isolate({
      input$num_weight/( input$num_height * input$num_height)

    })
    
    if values$bmi <= 15.99  values$status <- "Severe thinness"
    if values$bmi >= 16 && values$bmi <= 16.99  values$status <- "Severe thinness"
    if values$bmi >= 16 && values$bmi <= 16.99  values$status <- "Moderate thinness"
    if values$bmi >= 17 && values$bmi <= 18.49  values$status <- "Mild thinness"
    if values$bmi >= 18.50 && values$bmi <= 24.99  values$status <- "Normal weight"
    if values$bmi >= 25 && values$bmi <= 29.99  values$status <- "Overweight"
    if values$bmi >= 30 && values$bmi <= 34.99  values$status <- "Obese - class I"
    if values$bmi >= 35 && values$bmi <= 39.99  values$status <- "Obese - class II"
    if values$bmi >= 40 values$status <- "Obese - class III"
  })
  
  # Display values entered
  output$text_height <- renderText({
    input$action_Calc
    paste("Height in CM :", isolate(input$num_height))
  })
  
  output$text_weight <- renderText({
    input$action_Calc
    paste("Weight in KG : ", isolate(input$num_weight))
  })
  
  # Display calculated values
  
  output$text_BMI <- renderText({
    if(input$action_Calc == 0) ""
    else
      paste("Your BMI IS:", values$bmi)
  })
  
  output$text_status <- renderText({
    if(input$action_Calc == 0) ""
    else 
      paste("Your BMI value according to WHO:", values$status)
  })
  
  
})