
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
data(mtcars)

shinyServer(function(input, output) {
  output$result <- renderText({ 
    cyl <- if(input$cyl=="NA"){NA} else { as.numeric(input$cyl)}
    hp <- as.numeric(input$hp)
    mpg <- as.numeric(input$mpg)
    
    subset <- mtcars
    if(!is.na(cyl)){
      subset <- subset[subset$cyl==cyl,]
    }
    subset<-subset[subset$mpg>=mpg,]
    subset<-subset[subset$hp>=hp,]
    subset$hpDist <- subset$hp-hp
    subset$mpgDist <- subset$mpg-mpg
    minHpDist <- min(subset$hpDist)
    minMPGDist<-min(subset$mpgDist)
    result <- paste0(sprintf("<tr><td>%s</td><td style=\"%s\">%1.1f</td><td style=\"%s\">%1.0f</td><td>%1.0f</td>", rownames(subset), ifelse(subset$mpgDist==minMPGDist, "background-color:green; color:white;", ""), subset$mpg, ifelse(subset$hpDist==minHpDist, "background-color:green; color:white;", ""), subset$hp, subset$cyl), collapse="")
    paste("<table style=\"width: 100%;\"><tr><th>Car</th><th>MPG</th><th>HP</th><th>Cyl</th></tr>", result
          ,"</table>")
  })  
})
