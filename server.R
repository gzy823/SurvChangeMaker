#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

server <- function(input, output) {
  observe(if (input$DataSet == 'lung'){output$DataSetTable <- renderDataTable(datatable(lung))
                                       output$DataSetInfo <- renderText('inst:	 Institution code')
                                       output$DataSetInfo <- renderText({
                                         paste('<h3>','NCCTG Lung Cancer Data','</h3>','<br>',
                                               '<h4>','Survival in patients with advanced lung cancer from the North Central Cancer Treatment 
                                                  Group. Performance scores rate how well the patient can perform usual daily activities.',
                                               '</h4>','<br>',
                                               'inst:	 Institution code', '<br>',
                                               'time: Survival time in days','<br>',
                                               'status: censoring status 1 = censored, 2 = dead','<br>',
                                               'age: age in years','<br>',
                                               'sex: Male = 1 Female = 2','<br>',
                                               'ph.ecog: ECOG performance score(0 = good 5 = dead','<br>',
                                               'ph.karno: Karnofsky performance score (bad=0-good=100) rated by physician','<br>',
                                               'pat.karno: Karnofsky performance score as rated by patient','<br>',
                                               'meal.cal: Calories consumed at meals','<br>',
                                               'wt.loss: Weight loss in last six months')
                                       })
                                       fit <- survfit(Surv(time, status) ~ sex, data = lung)
                                       p <- ggsurvplot(fit, data = lung,
                                                       title = "Survival Curves",
                                                       pval = TRUE, pval.method = TRUE,    # Add p-value &  method name
                                                       surv.median.line = "hv",            # Add median survival lines
                                                       legend.title = "Sex",               # Change legend titles
                                                       legend.labs = c("Male", "female"),  # Change legend labels
                                                       palette = "jco",                    # Use JCO journal color palette
                                                       risk.table = TRUE,                  # Add No at risk table
                                                       cumevents = TRUE,                   # Add cumulative No of events table
                                                       tables.height = 0.15,               # Specify tables height
                                                       tables.theme = theme_cleantable(),  # Clean theme for tables
                                                       tables.y.text = FALSE               # Hide tables y axis text
                                       )
                                       
                                       output$DataSetPlot1 <- renderPlot({
                                         p
                                       })
                                       
                                       })
  observe(if (input$DataSet == 'iris'){output$DataSetTable <- renderDataTable(datatable(iris))})
  
               
 
  
   
  
}

