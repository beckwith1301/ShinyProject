#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(quantmod)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
        options("getSymbols.warning4.0"=FALSE)
        
        getdata<-reactive({
                stk1<-input$symbol1
                stk2<-input$symbol2
                from.dat<-input$dates[1]
                to.dat<-input$dates[2]
                stock1<-getSymbols(stk1, src='google', auto.assign=FALSE,from=from.dat,to=to.dat)
                stock2<-getSymbols(stk2, src='google', auto.assign=FALSE,from=from.dat,to=to.dat)
                stock1<-data.frame(Date=index(stock1),stock1[,4])
                stock2<-data.frame(Date=index(stock2),stock2[,4])
                merge(stock1,stock2)
        })
        
        output$Plot1 <- renderPlotly({
                data1<-getdata()
                plot_ly(data1, x=~Date,y=data1[,2], type='scatter',mode='lines',name=input$symbol1) %>%
                        add_trace(y=data1[,3], name=input$symbol2, mode='lines') %>%
                        layout(yaxis=list(title="Price"))
    
  })
  
})
