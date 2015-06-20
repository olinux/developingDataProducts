
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("The car selector"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    wellPanel(
      h3("How To"),
      p("Select your preferences in terms of miles per gallons, horse power and cylinders. You will then see the according cars in the result table on the left. The highlighted columns indicate the values which are the closest to your selection.")
    ),
    
    sliderInput("mpg", "Miles per gallon", min=10, max=40, value=10),
    sliderInput("hp", "Horse power", min=50, max=300, value=50),
    selectInput("cyl", "Cylinders", c("Irrelevant"=NA, "4"=4, "6"=6, "8"=8))
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    
    htmlOutput("result")
  )
))
