library(shiny)
library(tidyverse)
library(cowplot)

d <- read.csv2('https://notendur.hi.is/thj73/data/pulseEn.csv') %>%
    na.omit()

tDens <- tibble(t = seq(-5, 5, by = 0.01), dens = dt(t, df = nrow(d) - 1))

shinyApp(
ui <- fluidPage(
    fluidRow(
             column(4, 
                numericInput('nullHypo', 'Null hypothesis', value = 155, min = 150, max = 200),
                numericInput('alpha', 'Significance level', value = 0.05, min = 0.01, step = 0.01),
                textOutput('statistic'),
                textOutput('pval'),
                textOutput('confL'),
                textOutput('confU')
             ),
             column(5,
                plotOutput('dist'),
                plotOutput('conf')
             )
        )
)
perTTest <- function(null, alpha) {
    tt <- t.test(d$height, mu = null, conf.level = 1 - alpha)
    return(list(s = round(tt$statistic, 4),  e = tt$estimate, 
                p = round(tt$p.value, 6), cl = round(tt$conf.int[1], 4), 
                cu = round(tt$conf.int[2], 4)))
}

theo <- function(alpha){
    qt(p = alpha, df = nrow(d) - 1)
}


server <- function(input, output, session) {
    tt <- reactive(perTTest(null = input$nullHypo, alpha = input$alpha))
    theoT <- reactive(theo(input$alpha))
    output$dist <- renderPlot({
        tDens %>%
            ggplot(aes(x = t, y = dens)) +
                geom_line() +
                geom_vline(xintercept = tt()$s, lty = 2) +
                geom_area(aes(x = ifelse(t <= theoT(), t, NA)), fill = 'red', alpha = 0.5) +
                geom_area(aes(x = ifelse(t >= abs(theoT()), t, NA)), fill = 'red', alpha = 0.5) +
                labs(y = '') + 
                theme_cowplot()
    }, res = 96, width = 800)

    output$conf <- renderPlot({
        tibble(m = tt()$e, cl = tt()$cl, 
               cu = tt()$cu, y = 't-test', 
               null = input$nullHypo) %>%
            ggplot(aes(x = m, y = y)) +
                geom_point() +
                geom_errorbarh(aes(xmin = cl, xmax = cu), height = 0) +
                geom_point(aes(x = null), col = 'red') +
                theme_cowplot() +
                labs(x = '', y = '')
    }, res = 96, width = 800)

    output$statistic <- renderText({
        paste0('t-statistic: ', tt()$s)
    })

    output$pval <- renderText({
        paste0('p.value: ', tt()$p)
    })

    output$confL <- renderText({
        paste0('conf.int lower: ', tt()$cl)
    })

    output$confU <- renderText({
        paste0('conf.int upper ', tt()$cu)
    })

    
}
)
#shinyApp(ui, server)
