library(tidyverse)
library(here)

puls <- read_csv2("https://edbook.hi.is/gogn/pulsAll.csv")

puls2 <-
    puls %>%
    rename(course = namskeid, 
           coin = kronukast, 
           height = haed, 
           weight = thyngd, 
           age = aldur,
           sex = kyn, 
           smokes = reykir,
           drinks = drekkur, 
           gym = likamsraekt, 
           firstPulse = fyrriPuls,
           secondPulse = seinniPuls, 
           intervention = inngrip,
           date = dagsetning) %>%
    select(height, weight, age, sex, smokes, 
           drinks, firstPulse, secondPulse, intervention) %>%
    mutate(smokes = case_when(smokes == 'ja' ~ 'yes', 
                              smokes == 'nei' ~ 'no'), 
           drinks = case_when(drinks == 'ja' ~ 'yes',
                              drinks == 'nei' ~ 'no'), 
           intervention = case_when(intervention == 'hljop' ~ 'active', 
                                    intervention == 'sat_kyrr' ~ 'stationary'), 
           id = 1:nrow(puls)) %>%
    relocate(id, .before = 'height')

write.table(x = puls2, file = here('data', 'pulseEn.csv'), sep = ';', row.names = F)
