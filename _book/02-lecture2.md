# Lecture 2: Data wrangling


```r
library(tidyverse)
library(here) # relative paths
library(readxl)
```

## R Projects and workflows
Last week we used the `mtcars` data set which is included with R. When we want load external data we have to tell R where to find it. To tell R where our files are, we need to supply R with the file paths. This is a good opportunity to introduce some basic workflow. 

Let us assume that we have been tasked with performing a preliminary analysis of some data set. Our supervisor expects us to:

a. Present our results in a couple of days.

b. Hand over the preliminary analysis to the resident data scientist for downstream modeling.

There are thus two things we have to keep in mind; we need to perform the preliminary analysis AND we need to do it in such a way that the data scientist can continue our work as painlessly as possible. We need to *get organized*. This means:

* For each project we work on, we create a *dedicated folder* for that specific project. Any files relevant to a project are **placed in the project folder**.

* The project folder is compartmentalized! That is, there are multiple subdirectories within each project folder, each serving a specific purpose.

Here is an example layout for this hypothetical scenario:

```
Within folder ourProject:
-code/      code to wrangle original data
-data/      output of code
-raw/       original data files
-report/    our .Rmd file
```

Having created our project folder with the relevant structure the next thing we do is to create an [R project file](https://support.rstudio.com/hc/en-us/articles/200526207-Using-RStudio-Projects). By creating an R project, we are telling R where our base of operations is (our working directory). This means that we can use relative paths, namely, instead of writing full file path names like `C:\Documents\ourProject\data\someData.csv` it suffices to write `data\someData.csv`.

Finally, I recommend you use the `here` package as `.Rmd` files use their location as the working directory. Using the file structure above as an example, since our `.Rmd` file will be saved within `report` if we try to point to the data file `someData.csv` with `data/someData.csv` we will be met with an error. `here` looks for the location of the R project file `.Rproj` and sets all file paths relative to `.Rproj`. 

After completing the preliminary analysis we can simply hand over the `ourProject` directory to the data scientist. This is reproducible research in its most basic form. 

### More intricate workflow
Look into [Snakemake](https://snakemake.readthedocs.io/en/stable/), `renv`, [github](https://github.com/), `DiagrammeR`, and [Docker](https://www.docker.com/).

## The anatomy of a file and external data
Consider the following data:

```
id;type;age
1;a;30
2;b;37
3;a;42
```
The first line is called the **header**. It is where the names of the columns (sometimes referred to as fields) are stated. Note that not all data comes with a header line. Most functions which read data into memory assume that there is a header line so you don't have to explicitly state that your file has one. The lines that follow our header store the data values. The semicolon `;` between each value acts as the **delimiter**. The delimiter helps R to map values to their respective columns. The delimiter is not necessarily `;`. Here is a non exhaustive list:

* Comma `,`. Data where the comma is the delimiter are typically stored in `.csv` files. `.csv` stands for *Comma-Separated Values*. You can read in `.csv` files with the `read_csv()` function from `readr`.

* Semicolon `;`. Data where the semicolon is the delimiter are typically stored in `.csv` files as well. You can read in data with semicolon-separated values with the `read_csv2()` function from `readr`.

* Tab `\t`. Data where `\t` (tab) is the delimiter are typically stored in `.csv` or `.tsv` files. `.tsv` stands for *Tab-Separated Values*. You can read in `.tsv` files with the `read_tsv()` function from `readr`.

There are other delimiters. You can use the general function `read_delim()` to specify them (and the ones mentioned above). Finally, Excel spreadsheets `.xls` and `.xlsx` are quite common as well. To read those into R we can use the `readxl` package.

Below are a few examples where I use `here`, `readr`, and `readxl` to read in some dummy data I created (see Appendix).


```r
dummyTSV <- read_tsv(here('data', 'l2_data_tsv.txt'))
#> Rows: 10000 Columns: 4
#> ── Column specification ────────────────────────────────────────────────────
#> Delimiter: "\t"
#> chr (1): type
#> dbl (3): id, age, metric1
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
dummyCSV <- read_csv(here('data', 'l2_data_csv.txt'))
#> Rows: 10000 Columns: 4
#> ── Column specification ────────────────────────────────────────────────────
#> Delimiter: ","
#> chr (1): type
#> dbl (3): id, age, metric1
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
dumyCSV2 <- read_csv2(here('data', 'l2_data_csv2.txt'))
#> ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.
#> Rows: 10000 Columns: 4
#> ── Column specification ────────────────────────────────────────────────────
#> Delimiter: ";"
#> chr (1): type
#> dbl (2): id, age
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
dummyXLSX <- read_xlsx(here('data', 'l2_data_excel.xlsx'))
```


```r
dummyXLSX
#> # A tibble: 10,000 × 4
#>       id type    age metric1
#>    <dbl> <chr> <dbl>   <dbl>
#>  1     1 a        32    31.4
#>  2     2 c        33    42.4
#>  3     3 a        41    40.4
#>  4     4 b        37    75.7
#>  5     5 a        35    66.9
#>  6     6 c        37    64.8
#>  7     7 c        40    52.0
#>  8     8 b        34    35.7
#>  9     9 b        36    30.2
#> 10    10 c        36    34.5
#> # … with 9,990 more rows
```

## Factors
We will continue to use `dummyXLSX`. Let's get an overview of the data with the `glimpse()` function from `dplyr`:


```r
glimpse(dummyXLSX)
#> Rows: 10,000
#> Columns: 4
#> $ id      <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,…
#> $ type    <chr> "a", "c", "a", "b", "a", "c", "c", "b", "b…
#> $ age     <dbl> 32, 33, 41, 37, 35, 37, 40, 34, 36, 36, 37…
#> $ metric1 <dbl> 31.41350, 42.44945, 40.40657, 75.74094, 66…
```
From `glimpse()` we see that we have four variables, three of which are of type double and one which is a character. Let's use the `summary()` function from the last lecture to further probe our data:


```r
summary(dummyXLSX)
#>        id            type                age       
#>  Min.   :    1   Length:10000       Min.   :23.00  
#>  1st Qu.: 2501   Class :character   1st Qu.:32.00  
#>  Median : 5000   Mode  :character   Median :35.00  
#>  Mean   : 5000                      Mean   :34.51  
#>  3rd Qu.: 7500                      3rd Qu.:37.00  
#>  Max.   :10000                      Max.   :45.00  
#>     metric1      
#>  Min.   :-13.54  
#>  1st Qu.: 39.62  
#>  Median : 49.94  
#>  Mean   : 49.82  
#>  3rd Qu.: 59.91  
#>  Max.   :102.87
```

All looks well except the `type` variable which only takes on values `a`, `b`, and `c`. I would like to see just how many observations fall under each type. This is a good opportunity to discuss factor variables. A factor variable is a variable which has *levels* and *labels*. The levels of `type` are the aforementioned `a`, `b`, and `c`, (the values `type` takes) and labels contains the "name" of each level. For example, `a` could be a participant with diabetes, `b` a participant with heart disease and `c` our controls. One of the levels of a factor variable will be the *baseline*. Unless told to do otherwise, R will arrange levels in alphabetical order so for `type`, `a` will be the baseline since it is the first letter of the alphabet.

Let's create a new variable based on the schema above.



```r
dummyXLSX <- 
    dummyXLSX %>% 
    mutate(factorType = factor(type, 
                               levels = c('a', 'b', 'c'), 
                               labels = c('Diabetes', 'Heart disease', 'Control')))
```


```r
summary(dummyXLSX)
#>        id            type                age       
#>  Min.   :    1   Length:10000       Min.   :23.00  
#>  1st Qu.: 2501   Class :character   1st Qu.:32.00  
#>  Median : 5000   Mode  :character   Median :35.00  
#>  Mean   : 5000                      Mean   :34.51  
#>  3rd Qu.: 7500                      3rd Qu.:37.00  
#>  Max.   :10000                      Max.   :45.00  
#>     metric1               factorType  
#>  Min.   :-13.54   Diabetes     :3424  
#>  1st Qu.: 39.62   Heart disease:3292  
#>  Median : 49.94   Control      :3284  
#>  Mean   : 49.82                       
#>  3rd Qu.: 59.91                       
#>  Max.   :102.87
```

## Filter
Now, say that I want to restrict my analysis to participants who scored over 50 on the "test" for `dummyXLSX` (variable `metric1`). A very useful tool is the `filter()` function from `dplyr` which allows us to subset our data based on logic operations. 


```r
dummyXLSX %>%
    filter(metric1 > 50)
#> # A tibble: 4,978 × 5
#>       id type    age metric1 factorType   
#>    <dbl> <chr> <dbl>   <dbl> <fct>        
#>  1     4 b        37    75.7 Heart disease
#>  2     5 a        35    66.9 Diabetes     
#>  3     6 c        37    64.8 Control      
#>  4     7 c        40    52.0 Control      
#>  5    13 a        33    62.7 Diabetes     
#>  6    15 b        37    60.4 Heart disease
#>  7    17 b        38    75.3 Heart disease
#>  8    19 c        38    61.5 Control      
#>  9    20 a        32    76.1 Diabetes     
#> 10    21 c        32    61.0 Control      
#> # … with 4,968 more rows
```

Note how over half of our observations are gone. We can filter our data even further, for example by restricting our analysis to participants with Diabetes and Heart disease who scored higher than 50 on `metric1`.


```r
dummyXLSX %>%
    filter(metric1 > 50, type %in% c('a', 'b'))
#> # A tibble: 3,328 × 5
#>       id type    age metric1 factorType   
#>    <dbl> <chr> <dbl>   <dbl> <fct>        
#>  1     4 b        37    75.7 Heart disease
#>  2     5 a        35    66.9 Diabetes     
#>  3    13 a        33    62.7 Diabetes     
#>  4    15 b        37    60.4 Heart disease
#>  5    17 b        38    75.3 Heart disease
#>  6    20 a        32    76.1 Diabetes     
#>  7    23 a        31    54.4 Diabetes     
#>  8    25 a        34    51.7 Diabetes     
#>  9    26 b        29    57.0 Heart disease
#> 10    30 b        32    54.7 Heart disease
#> # … with 3,318 more rows
```

The resulting data is even smaller. Below is a list of some of the operators we can use to compare values:

* `>`: Used for $x > y$ which is read as *x is greater than y*.

* `<`: Used for $x < y$ which is read as *x is lesser than y*.

* `>=`: Used for $x \geq y$ which is read as *x is greater OR equal to y*

* `<=`: Used for $x \leq y$ which is read as *x is lesser OR equal to y*.

* `==`: Used for $x = y$ which is read as *x is the same as y*. The double `==` is **not a mistake**.

Here is a small example of `==`:


```r
dummyXLSX %>%
    filter(factorType == 'Diabetes')
#> # A tibble: 3,424 × 5
#>       id type    age metric1 factorType
#>    <dbl> <chr> <dbl>   <dbl> <fct>     
#>  1     1 a        32    31.4 Diabetes  
#>  2     3 a        41    40.4 Diabetes  
#>  3     5 a        35    66.9 Diabetes  
#>  4    12 a        30    34.8 Diabetes  
#>  5    13 a        33    62.7 Diabetes  
#>  6    14 a        35    49.6 Diabetes  
#>  7    20 a        32    76.1 Diabetes  
#>  8    22 a        36    49.0 Diabetes  
#>  9    23 a        31    54.4 Diabetes  
#> 10    24 a        35    33.2 Diabetes  
#> # … with 3,414 more rows
```

## ifelse and case_when
Assume we want to create a new variable such that participants who scored higher than 50 on `metric1` are labeled as *high* and those who scored lower or equal to 50 are labeled as low. We can use the `ifelse()` function to this end. First and example and then a dissection.


```r
dummyXLSX <-
    dummyXLSX %>%
    mutate(scoreCat = ifelse(metric1 > 50, 'High', 'Low'))
```


```r
dummyXLSX
#> # A tibble: 10,000 × 6
#>       id type    age metric1 factorType    scoreCat
#>    <dbl> <chr> <dbl>   <dbl> <fct>         <chr>   
#>  1     1 a        32    31.4 Diabetes      Low     
#>  2     2 c        33    42.4 Control       Low     
#>  3     3 a        41    40.4 Diabetes      Low     
#>  4     4 b        37    75.7 Heart disease High    
#>  5     5 a        35    66.9 Diabetes      High    
#>  6     6 c        37    64.8 Control       High    
#>  7     7 c        40    52.0 Control       High    
#>  8     8 b        34    35.7 Heart disease Low     
#>  9     9 b        36    30.2 Heart disease Low     
#> 10    10 c        36    34.5 Control       Low     
#> # … with 9,990 more rows
```

So how does `ifelse()` work? The function takes in three inputs: a test we want to perform (is the `metric1` score higher than 50?), an action if the test is true (High), and an action if the test is false (metric1 $\leq$ 50; Low). We can create complicated tests with the `&` and `|` operators which symbolize AND and OR respectively. 


```r
dummyXLSX <-
    dummyXLSX %>%
    mutate(scoreCatAge = ifelse(metric1 > 50 & age > 30, 'Both true', 'One or both false'))
```


```r
dummyXLSX %>%
    select(age, metric1, scoreCatAge)
#> # A tibble: 10,000 × 3
#>      age metric1 scoreCatAge      
#>    <dbl>   <dbl> <chr>            
#>  1    32    31.4 One or both false
#>  2    33    42.4 One or both false
#>  3    41    40.4 One or both false
#>  4    37    75.7 Both true        
#>  5    35    66.9 Both true        
#>  6    37    64.8 Both true        
#>  7    40    52.0 Both true        
#>  8    34    35.7 One or both false
#>  9    36    30.2 One or both false
#> 10    36    34.5 One or both false
#> # … with 9,990 more rows
```


```r
dummyXLSX %>%
    mutate(orStatement = ifelse(metric1 > 50 | age < 30, 'One or both true', 'Both false')) %>%
    select(age, metric1, orStatement)
#> # A tibble: 10,000 × 3
#>      age metric1 orStatement     
#>    <dbl>   <dbl> <chr>           
#>  1    32    31.4 Both false      
#>  2    33    42.4 Both false      
#>  3    41    40.4 Both false      
#>  4    37    75.7 One or both true
#>  5    35    66.9 One or both true
#>  6    37    64.8 One or both true
#>  7    40    52.0 One or both true
#>  8    34    35.7 Both false      
#>  9    36    30.2 Both false      
#> 10    36    34.5 Both false      
#> # … with 9,990 more rows
```


Assume we want to create a variable which combines multiple scenarios. It is possible to nest `ifelse()` within `itself()` but this quickly becomes obnoxious and confusing. This is where `case_when()` comes in as it allows us to strictly define what value our new variable takes based on the scenario. Here is one:


```r
dummyXLSX %>%
    mutate(scenarios = case_when(age > 35 & metric1 < 50 & type == 'c' ~ 'Control, > 35, < 50',
                                 age > 35 & metric1 > 50 & type == 'b' ~ 'Heart, > 35, > 50',
                                 age <= 35 & metric1 <= 50 & type == 'a' ~ 'Diabetes, <= 35, <= 50',
                                 TRUE ~ 'Whatever does not fit')) %>% 
    select(age, metric1, type, scenarios)
#> # A tibble: 10,000 × 4
#>      age metric1 type  scenarios             
#>    <dbl>   <dbl> <chr> <chr>                 
#>  1    32    31.4 a     Diabetes, <= 35, <= 50
#>  2    33    42.4 c     Whatever does not fit 
#>  3    41    40.4 a     Whatever does not fit 
#>  4    37    75.7 b     Heart, > 35, > 50     
#>  5    35    66.9 a     Whatever does not fit 
#>  6    37    64.8 c     Whatever does not fit 
#>  7    40    52.0 c     Whatever does not fit 
#>  8    34    35.7 b     Whatever does not fit 
#>  9    36    30.2 b     Whatever does not fit 
#> 10    36    34.5 c     Control, > 35, < 50   
#> # … with 9,990 more rows
```

## summarize and group_by
A preliminary analysis can be divided into two (roughly) parts: the numerical analysis and the graphical analysis. 
Common statistics we are asked to compute are the sample size, mean, standard deviation, minimum, maximum, and quantiles (typically the 2.5% and 97.5% percentiles) of our sample. For that end we have the following functions: `n()`, `mean()`, `sd()`, `min()`, `max()`, and `quantile()`. All these functions take in some numerical vector and return the statistic of interest. We will discuss these statistics in more detail next week.

Let's compute these statistics for variable `age`:


```r
nrow(dummyXLSX)
#> [1] 10000
mean(dummyXLSX$age)
#> [1] 34.5138
sd(dummyXLSX$age)
#> [1] 3.182487
min(dummyXLSX$age)
#> [1] 23
max(dummyXLSX$age)
#> [1] 45
quantile(dummyXLSX$age, probs = 0.025)
#> 2.5% 
#>   28
quantile(dummyXLSX$age, probs = 0.975)
#> 97.5% 
#>    41
```

An alternative way to do the above is to use the `summarize()` function:


```r
dummyXLSX %>%
    summarize(sampleSize = n(), 
              mean = mean(age), 
              standardDev = sd(age), 
              mini = min(age), 
              maxi = max(age), 
              q025 = quantile(age, 0.025), 
              q975 = quantile(age, 0.975))
#> # A tibble: 1 × 7
#>   sampleSize  mean standardDev  mini  maxi  q025  q975
#>        <int> <dbl>       <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1      10000  34.5        3.18    23    45    28    41
```

Both methods yield the same answer. Now, imagine that we want to compute each of these statistics stratified by the type of the patient. This can be done with base R function but I recommend using the `summarize()` function with the `group_by()` function. To put it simply, the `group_by()` function allows us to define groups and then "wrangle" based on those groups. Let's see what happens.


```r
dummyXLSX %>% 
    group_by(type) %>%
    summarize(sampleSize = n(), 
              mean = mean(age), 
              standardDev = sd(age), 
              mini = min(age), 
              maxi = max(age), 
              q025 = quantile(age, 0.025), 
              q975 = quantile(age, 0.975))
#> # A tibble: 3 × 8
#>   type  sampleSize  mean standardDev  mini  maxi  q025  q975
#>   <chr>      <int> <dbl>       <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 a           3424  34.5        3.17    23    45    28    41
#> 2 b           3292  34.5        3.16    24    45    28    41
#> 3 c           3284  34.5        3.21    24    45    28    41
```
The code is basically the same as before save for that one additional line. Pretty convenient, right?

## gather and spread
Data can be *long* or *wide*. When our data is wide we have one column for each variable. Imagine we conducted a study where we took some measurements twice over the research period. The data could look something like this:


```r
wideExample <- 
    tibble(id = 1:3, 
       measure1 = rnorm(3), 
       measure2 = rnorm(3))
```


```r
wideExample
#> # A tibble: 3 × 3
#>      id measure1 measure2
#>   <int>    <dbl>    <dbl>
#> 1     1   -2.12    -0.390
#> 2     2    0.339    1.09 
#> 3     3   -0.322    0.514
```

Now, it might actually be more beneficial for each measurement to have its own row. When each measurement has its own row we say that the data is long. To convert from wide to long we use the `gather()` function. It has actually been superseeded by `pivot_longer()` but I'm more used to `gather()`. The function `gather()` takes in: the names of the two new columns we are creating ("key", "value") and then a selection of columns. We want each measurement to have its own line so our selection will be `measure1` and `measure2`.


```r
wideExample %>%
    gather(measurement, value, measure1, measure2)
#> # A tibble: 6 × 3
#>      id measurement  value
#>   <int> <chr>        <dbl>
#> 1     1 measure1    -2.12 
#> 2     2 measure1     0.339
#> 3     3 measure1    -0.322
#> 4     1 measure2    -0.390
#> 5     2 measure2     1.09 
#> 6     3 measure2     0.514
```

Alternatively we can just use the `-` prefix to tell R which columns to ignore:


```r
wideExample %>%
    gather(measurement, value, -id)
#> # A tibble: 6 × 3
#>      id measurement  value
#>   <int> <chr>        <dbl>
#> 1     1 measure1    -2.12 
#> 2     2 measure1     0.339
#> 3     3 measure1    -0.322
#> 4     1 measure2    -0.390
#> 5     2 measure2     1.09 
#> 6     3 measure2     0.514
```

To go from long to wide we have the function `spread()` or `pivot_wider()`. I encourage you to try it out for yourselves.

### Why this is useful
The long format is often useful when we want to fit models where we have repeated measurements. It's also useful for when we want to summarize multiple variables simultaneously. Recall from the `summarize()` section when we summarized `age`. There are many more variables that we might be interested in summarizing such as `metric1`. Here is an example where we combine `gather()`, `group_by()`, and `summarize()`.


```r
# Let's add another variable to dummyXLSX
dummyXLSX %>%
    mutate(someVar = rnorm(n = n())) %>%
    gather(variables, values, age, metric1, someVar) %>%
    group_by(variables) %>%
    summarize(mean = mean(values), 
              sd = sd(values),
              median = median(values))
#> # A tibble: 3 × 4
#>   variables    mean    sd  median
#>   <chr>       <dbl> <dbl>   <dbl>
#> 1 age       34.5     3.18 35     
#> 2 metric1   49.8    15.0  49.9   
#> 3 someVar    0.0235  1.01  0.0249
```

Here is another example where we include the type of the participants.


```r
dummyXLSX %>%
    mutate(someVar = rnorm(n = n())) %>%
    gather(variables, values, age, metric1, someVar) %>%
    group_by(variables, type) %>%
    summarize(mean = mean(values), 
              sd = sd(values),
              median = median(values)) %>%
    arrange(type)
#> `summarise()` has grouped output by 'variables'. You can override using the `.groups` argument.
#> # A tibble: 9 × 5
#> # Groups:   variables [3]
#>   variables type      mean     sd    median
#>   <chr>     <chr>    <dbl>  <dbl>     <dbl>
#> 1 age       a     34.5      3.17  35       
#> 2 metric1   a     49.5     14.9   49.5     
#> 3 someVar   a     -0.00182  0.998 -0.00874 
#> 4 age       b     34.5      3.16  34       
#> 5 metric1   b     50.1     15.1   50.2     
#> 6 someVar   b      0.0196   1.00   0.0339  
#> 7 age       c     34.5      3.21  35       
#> 8 metric1   c     49.8     15.2   50.1     
#> 9 someVar   c     -0.00188  1.01  -0.000704
```



## Appendix


```r
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
```

