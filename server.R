library(shiny)
library(caret)
library(rattle)
library(rpart)
library(rpart.plot)
library(e1071)

set.seed(1234)
train<-createDataPartition(iris$Species,p=0.8,list=F)
iristrain<-iris[train,]
iristest<-iris[-train,]

shinyServer(
  function(input,output)
  {
    mytrain <- reactive({iristrain})
    mytest <- reactive({iristest})
    
    decisiontree<-reactive({rpart(data=mytrain(),Species~.,minsplit=input$minsplit,
                                  minbucket=input$minbucket) })
    myprediction<-reactive({predict(decisiontree(),newdata=mytest(),type="class")})
    acc<-reactive({confusionMatrix(myprediction(),mytest()$Species)})
    output$Fit1 <- renderPrint({acc()$table})
    output$Fit2 <- renderPrint({acc()$overall[1]})
    output$CTree <- renderPlot({
      fancyRpartPlot(decisiontree())
    })
  }
)
