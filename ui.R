library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel('Decision Trees for Classification'),
    sidebarPanel(
      sliderInput('minsplit', 'Minimum Number of Observations per Node', value=25, 
                  min=5, max=60, step=5),
      sliderInput('minbucket', 'Minimum Number of Observations per Leaf', value=5, 
                  min=5, max=20, step=5)
      ),
    mainPanel(
      tabsetPanel(type="tab",
                  tabPanel("Background/Help",
                           p("This shiny app demonstrates the impact of different parameters on building a classification tree with the rpart package.The app will use the well known iris data set for this classification task.The iris data set is splitted randomly in a training data set (used to build the classification model) and a test data set (used for prediction). The split is done using 80% for training and 20% for the test data."),
                           p(" The sliders on the left side allow you to vary various parameters rpart uses in building the classification model. The first choice you can make affects the  Minimum Number of Observations per Node, that is the minimum number of observations that must exist in a node in order for a split to be attempted.The second choice you can make affects the  Minimum Number of Observations per Leaf, that is the the minimum number of observations in any terminal or leaf node."),
                           p("The tab 'Classification Tree' will show you the fitted model based on the chosen parameters.The tab 'Confusion Matrix and Metrics' will show you the results when predicting the species for the test data set using the fitted model (confusion matrix respectively various metrics)."),
                           p("Author: Alexander Schniertshauer"),
                           p("Course: Coursera - Developing Data Products")
                           
                  ),
                  tabPanel("Classification Tree",plotOutput("CTree")),
                  tabPanel("Confusion Matrix and Metrics",verbatimTextOutput("Fit"))
      )            
    )
  )
)
