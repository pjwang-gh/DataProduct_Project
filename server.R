library(shiny)
library(lattice)
data(mtcars)

# Prediction function. Fits a linear regression between two variables
# Predict the mpg outcome given the value of car weight (in tons)
predictMPG <- function(weight) { 
        x <- mtcars$wt
        y <- mtcars$mpg
        modelFit <- lm(y~x)
        predict(modelFit, data.frame(x=weight))
}

shinyServer(
        function(input, output) {
                output$inputValue <- renderPrint({input$weight})
                output$prediction <- renderPrint({predictMPG(input$weight)[[1]]})
                
                output$regressionFit <- renderPlot({
                        plot(mtcars$wt, mtcars$mpg, xlab="Weight (in tons)", ylab="MPG", xlim=c(0.8,6), ylim=c(8,36), pch=19, col="blue")
                        abline(lm(mtcars$mpg~mtcars$wt), lwd=2, col="blue")
                        points(x = input$weight, y = predictMPG(input$weight), col = 'darkorange', pch = 4, cex = 2, lwd = 5)
                                       })
                         
        }                
)
