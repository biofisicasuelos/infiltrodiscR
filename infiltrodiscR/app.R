library(shiny)
library(rhandsontable)

ui <- shinyUI(fluidPage(
    fluidRow(
        titlePanel(title = "Demo rhandsontable & shiny - example app - editable data table"),
        h4("rhandsontable is an htmlwidget wrapper package based on the handsontable.js library created by Jonathan Owen. It produces a data grid with excel like appearance and features. "),
        h4("# how to create a rhandsontable object and use in shiny"),
        h4("# renderRHandsontable()"),
        h4("# rHandsontableOutput()"),
        hr(),
        column(4,
               helpText("non-editable table"),
               tableOutput("table1")),
        column(4,
               helpText("editable table"),
               rHandsontableOutput("table"),
               br(),
               actionButton("saveBtn","Save"))
    )

))

# Creating dataset
a = sample(1:10, replace=TRUE)
b = sample(1:10, replace= TRUE)
c = a + b
df1 = data.frame(a=a, b=b, c=c)

server <- shinyServer(function(input,output,session){

    # table1 object will have the datatable (not editable)
    output$table1 <- renderTable({
        df1
    })

    # returns rhandsontable type object - editable excel type grid data
    output$table <- renderRHandsontable({
        rhandsontable(df1) # converts the R dataframe to rhandsontable object
    })

    # on click of button the file will be saved to the working directory
    observeEvent(input$saveBtn,
                 write.csv(hot_to_r(input$table), file = "MyData.csv",row.names = FALSE))

    # hot_to_r() converts the rhandsontable object to r data object


})
