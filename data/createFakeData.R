library(here)
library(xlsx)

# Set seed for reproducibility
set.seed(1)

n <- 10000

# Create fake data with research ID, 
# participant type, age, and performance
# metric score

id <- 1:n
type <- sample(x = c('a', 'b', 'c'), size = n, replace = T)
age <- floor(rnorm(n = n, mean = 35, sd = sqrt(10)))
metric1 <- rnorm(n = n, mean = 50, sd = 15)

d <- data.frame(id, type, age, metric1)

# CSV
write.table(x = d, file = here('data', 'l2_data_csv.txt'), 
            row.names = F, quote = F, sep = ',')
# CSV2
write.table(x = d, file = here('data', 'l2_data_csv2.txt'), 
            row.names = F, quote = F, sep = ';')
# TSV
write.table(x = d, file = here('data', 'l2_data_tsv.txt'), 
            row.names = F, quote = F, sep = '\t')
# Excel
write.xlsx(x = d, file = here('data', 'l2_data_excel.xlsx'), 
           row.names = F, sheetName = 'DummyData')
