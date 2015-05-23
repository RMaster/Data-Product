library(shiny)

shinyUI(fluidPage(
  
  titlePanel("BMI Calculator"),
  
  sidebarLayout(
      sidebarPanel(
        
      helpText("This app calculates BMI - Body Mass Index based on your inputs."),            
      br(),            
      numericInput("num_height",label = h6("Enter the height (in cm)"),min = 5, max = 500,value = 150),
      br(),            
      numericInput("num_weight",label = h6("Choose the weight (in KG)"),min = 5, max = 500, value = 50),
      selected = 1 
      ), 
      
      br(),
      
      br(),   
      
      actionButton("action_Calc", label = "Refresh & Calculate")    
      
      ),
  
    mainPanel(
      
      tabsetPanel(
  
        
        tabPanel("BMI Calculator",
                 p(h5("Your entered values:")),
                 textOutput("text_height"),
                 textOutput("text_weight"),
                 br(),
                 p(h5("Calculated values:")),
                 textOutput("text_BMI"),
                 textOutput("text_status")
        ),
        tabPanel("Documentation",
                 p(h4("Simple BMI Calculator:")),
                 br(),
                 helpText("This application calculates BMI of person for given height and weight."),
                 HTML("<u><b>Equation for calculation: </b></u>
                        <br> <br>
                        <b> BMI = W /(H * H)</b>
                        <br>
                        where: <br>
                        BMI = Body Mass Index <br>
                        W = Weight in KG <br>
                        H = Height in CM <br> ")                
        )
      )
    )
  #)
  
))


