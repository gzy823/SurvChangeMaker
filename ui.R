## ui file for the changemaker project

library(shiny)
library(shinydashboard)
library(plotly)
# Define UI for application that draws a histogram

ui <- dashboardPage(
  dashboardHeader(title = "ChangeMaker"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem('Survival Analysis', tabName = "Surv", icon = icon("bar-chart-o")))
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = 'Surv',
              h1('Survival Analysis'),
              selectInput('DataSet', 'Select a dataset',c('lung','iris')),
              dataTableOutput('DataSetTable'),
              htmlOutput('DataSetInfo'),
              plotOutput('DataSetPlot1',
                         width = "500px", height = "500px")
              ) # end of the tab item
      ) # end of tabItems
    ) # end of dashboard body

   
  ) # end of dashboardpage

