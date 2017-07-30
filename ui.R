#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Timeseries plot of Stock Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       textInput("symbol1",label=h3("Stock #1"),value="AAPL"),
       textInput("symbol2",label=h3("Stock #2"),value="MSFT"),
       dateRangeInput("dates", label = h3("Date range"),
                      start="2008-01-01",end=Sys.Date(),
                      min="2007-01-03",max=Sys.Date()),
       submitButton("Submit"),
       h3("Enter any equity ticker symbols in the boxes above"),
       h3("Change the Date range as desired"),
       h3("Press 'Submit' to update the Time Series Plot")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h3("Time Series Plot"),
       plotlyOutput("Plot1")
    )
  )
))
