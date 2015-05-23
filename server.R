library(shiny)
library(car)

shinyServer(function(input, output) {
  
  values <- reactiveValues()
  
  observe({
    input$Calculate
    values$bmi <- isolate({
      input$num_weight/(input$num_height * input$num_height * 0.0001)
      
    })
  })
  
#   if values$bmi < 18.5 
#   {
#     values$status="Underweight"
#   }
#   else if values$bmi < 24.9
#   {
#     values$status="Normal weight"
#   }
#   else if values$bmi < 29.9
#   {
#     values$status="Overweight"
#   }
#   else
#   {
#     values$status="Obesity"
#   }  

  # Display values entered
  output$text_height <- renderText({
    input$Calculate
    paste("Height [CM] :", isolate(input$num_height))
  })
  
  output$text_weight <- renderText({
    input$Calculate
    paste("Weight [KG} : ", isolate(input$num_weight))
  })
  
  
    
  # Display calculated values
  
  output$text_BMI <- renderText({
    if(input$Calculate == 0) ""
    else
      
      paste("BMI is (Metric):", values$bmi)
  })
  
#   output$text_status <- renderText({
#     if(input$Calculate == 0) ""
#     else
#       
#       paste("BMI shows you are ", values$status)
#   })
  
})
