library(shiny)
library(lattice)

shinyUI(
        pageWithSidebar(
                headerPanel("MPG prediction"),
                sidebarPanel(
                        h2('Documentation'),
                        p('This app predicts car MPG using the car weight (in tons) as a predictor.'),
                        p('Move the slider to change the weight of a car in tons.'),
                        p('The results of the prediction are shown on the right panel.'),
                        p('A graph is displayed on the right panel with the MPG values in the y-axis and the weight of cars in tons in the x-axis.'),
                        p('The orange mark is placed at the predicted value on the regression line.'),
                        p('You may change your the weight of cars value (in tons) to see how the predicted value and the graph are updated.')
                ),
                mainPanel(
                        sliderInput('weight', 'Car Weight (in tons)', value = 3, min = 0, max = 6, step = 0.05),
                        h3('Prediction Results'),
                        h4('weight'),
                        p('Your car weight in tons selected for the prediction.'),
                        verbatimTextOutput('inputValue'),
                        h4('Prediction'),
                        p('Value predicted based on the car weight value you selected.'),
                        verbatimTextOutput('prediction'),
                        p('The orange mark is the predicted value according to the car weight value selected.'),
                        plotOutput('regressionFit')
                )
        )
)