library(shiny)
shinyUI(fluidPage(
  titlePanel("BMI Calculator"),
  
  sidebarLayout(
    sidebarPanel( 
      
      helpText("This app calculates BMI - Body Mass Index based on your inputs."),            
      br(),           
      numericInput("num_height",label = h4("Enter the height (in cm)"),min = 5, max = 500,0), #,value = 150
      br(),
      numericInput("num_weight",label = h4("Choose the weight (in KG)"),min = 5, max = 500,0), #, value = 50
      br(),
      
      br(),   
      actionButton("Calculate", label = "Calculate BMI")    
  
         
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("BMI Calculator",
          p(h4("Your entered values:")),
          textOutput("text_height"),
          textOutput("text_weight"),
          br(),
          p(h4("Calculated values:")),
          textOutput("text_BMI"),
          textOutput("text_status")
          
                 ),
        tabPanel(
          "Documentation",
          p(h4("Simple BMI Calculator:")),
          br(),
          helpText("This application calculates BMI of person for given height and weight. To calculate your BMI, enter your height and weight in the form"),
          p(h3("What is BMI?")),
          helpText("BMI means Body Mass Index. The BMI shows the relation between a person's height and weight, and can be used to indicate whether the person has a normal weight or if he/she is underweight or overweight. BMI can also be called the Quetelet index, after its inventor, the Belgian scientist Adolphe Quetelet (1796-1874)"),
          HTML("<u><b>Equation for calculation: </b></u>
                        <br> <br>
                        <b> BMI = W /(H * H)</b>
                        <br>
                        where: <br>
                        BMI = Body Mass Index <br>
                        W = Weight in KG <br>
                        H = Height in meters <br> ") 
          
                 )
        
        )
      
      )
  )
))
