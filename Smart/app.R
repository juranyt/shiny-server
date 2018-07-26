.libPaths( c( .libPaths(), "/home/jirik/R/x86_64-pc-linux-gnu-library/3.4") )
library("shiny")
library("DT")
source("load_smart_rating.R")

ui <- fluidRow(
  DTOutput('tbl')
)

server <- function(input, output) {
  df <- load_smart_rating("smartrating.xlsx")
  dt <- df %>% datatable(rownames = FALSE,
                         options = list(
                           dom = 't',
                           pageLength = nrow(df),
                           initComplete = JS("function(settings, json) {$(this.api().table().header()).css({'background-color' : '#e6ca49'});}"),
                           order = list(list(0, 'asc')),
                           columnDefs = list(list(className = 'dt-center', targets = 1:9)))) %>% formatRound(columns = c(2:9),digits = 2)
   output$tbl <- renderDT(dt)
  
}

# Run the application 
shinyApp(ui = ui, server = server)

