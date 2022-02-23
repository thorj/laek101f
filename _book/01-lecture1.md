# Lecture 1: R and R basics




## Installing R and RStudio
Before you install RStudio, you need to install R. Please visit [this link](https://cran.hafro.is/) and download R for your operating system. Afterwards, you can download RStudio from [here](https://www.rstudio.com/products/rstudio/download/#download). 

Alternatively, you can create an account on [RStudio Cloud](https://rstudio.cloud/) which is a cloud-based version of RStudio.

## What is the difference between R and RStudio?
R is a *programming language* specifically designed for statistics while RStudio is an Integrated Development Environment (IDE). RStudio combines multiple tool into a single graphical user interface (GUI) to ease development of R programs. Examples of tools are the source-code environment, file navigation, and plot viewer. 

There exist alternatives to RStudio. I personally use [Nvim-R](https://github.com/jalvesaq/Nvim-R) but like many others I started my R journey with RStudio.

## What is the difference between .R and .Rmd files?
A file with the `.R` extension is a *script file* for R. A script file contains the code you have written. A `.R` file is "stupid" in the sense that it will follow your instructions to the letter. You have to tell the computer to run an R scrip by opening command prompt/terminal, navigating to your root folder, and writing `Rscript yourScript.R`.

A file with the `.Rmd` extension is a *markdown file*. It allows you to combine code and text to write detailed reports. An example of an `.Rmd` file is this lecture. 

## Hello world
Here is a very simple piece of R code inside this `.Rmd` document:


```r
# Example of embedded code
print('Hello world')
#> [1] "Hello world"
```

The anatomy of the code is as follows:

- `# Example of embedded code`. The # symbol tells R that it should *ignore* whatever comes after # on that particular line. This is useful as it allows us to *comment our code*. Comments allow you to explain how and what your code does. Writing informative, concise comments *is extremely important*. There is a good chance that you will have to either share your code with a collaborator or you have to revisit it at a later time. In both cases, the comments can quickly bring the reader up to speed. 

- `print('Hello world')`. This line is composed of two things: the `print()` *function* and the *string* `'Hello world'`. A function is like a recipe; it has *inputs* and *outputs*. The recipe of `print()` is to take its input and display it on the command line. There are many predefined functions in R but you can also create your own. A string is a data type in R. The quotes tell R that whatever is between them should be considered as a string. If you remove the quotes, R will whine. You can also tell R that something is a string with double quotes. Pick whichever you prefer.


```r
# Function printMyString
# Input: A string.
# Output: The input string is printed out in the command line.
printMyString <- function(someString) {
    print(someString)
}
# Test case
printMyString("This is a custom function I made. It's pretty useless.")
#> [1] "This is a custom function I made. It's pretty useless."
```

## Other basic objects
R has many other objects besides strings such as integers, doubles (reals), vectors, factors, logical, and data frames. 

- An integer is a *whole number*. Examples of integers are 1, -2, 1000, 94.

- A double is a *real number*. Examples of real numbers are 1, -2, 3.14, sin(0.5).

- A vector is a *collection of values*. You define a vector with the `c()` function. For example `c(1, -2, 3.14, sin(0.5))` is a vector of doubles while `c('a', 'ab', 'bla bla')` is a vector of strings. Note that all elements in a vector have to be of the same data type. If there is a discrepancy, R will try to coerce the elements to be of the same data type.

- A factor is a way to store categorical values. As an example, imagine you have conducted a study on patients. One of the pieces of information you store is the *smoking status* of patients. Patients can be current smokers, previous smokers, or never smokers. The *levels* of the factor are `never`, `previous`, and `current`. We will discuss factor variables later.

- A logical value is either `TRUE` or `FALSE`. Logical values can also be encoded as `1` and `0` for `TRUE` and `FALSE` respectively. 

- A data frame is a collection of vectors. You can think of a data frame as an Excel spreadsheet with columns and rows. More on data frames later.

Note that this is not an exhaustive list.

## Storing objects in memory
We can store objects in memory with the `<-` operator. Whatever is on the **right** of `<-` is the object we want to store in memory and whatever is on the **left** of `<-` is the **name** of the object. Here is a quick example:


```r
x <- c(1, 2, 3)
x
#> [1] 1 2 3
```

The vector `c(1, 2, 3)` exists now in memory as the named variable `x` and rather than typing out `c(1, 2, 3)` whenever we want to work with that vector, we can simply use `x` instead. For example, imagine if we wanted to add 1 to the vector `c(1, 2, 3)`; since we have stored `c(1, 2, 3)` as the object `x` in R, we can simply write:


```r
x + 1
#> [1] 2 3 4
```

Be careful! If you reuse variable names the pre-existing object will be overwritten with the new object.


```r
x <- 'x is no longer a vector of numbers; it is a string'
x
#> [1] "x is no longer a vector of numbers; it is a string"
```

## Packages
R has many built-in functions and data types but sometimes we need more. Luckily, there is a good chance that someone in the R community has already solved our problem and made their work publicly available as an *R package*. An *R package* is thus simply a collection of functions and data types (and sometimes even data) that we can load into R and use.

You can download and install a package with the `install.packages()` function. To load a package you use the `library()` function. It is enough to install a package once but you must load it every time you open up RStudio (if you intend to use it).


```r
# This can be run once
install.packages('ggplot2')
# This is something you have to run every time 
# you restart R
library('ggplot2')
```

## The mtcars data
It's time to start working with data. Included with R is the `mtcars` data frame:


```r
mtcars
#>                      mpg cyl  disp  hp drat    wt  qsec vs
#> Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0
#> Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0
#> Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1
#> Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1
#> Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0
#> Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1
#> Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0
#> Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1
#> Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1
#> Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1
#> Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1
#> Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0
#> Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0
#> Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0
#> Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0
#> Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0
#> Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0
#> Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1
#> Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1
#> Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1
#> Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1
#> Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0
#> AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0
#> Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0
#> Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0
#> Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1
#> Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0
#> Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1
#> Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0
#> Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0
#> Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0
#> Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1
#>                     am gear carb
#> Mazda RX4            1    4    4
#> Mazda RX4 Wag        1    4    4
#> Datsun 710           1    4    1
#> Hornet 4 Drive       0    3    1
#> Hornet Sportabout    0    3    2
#> Valiant              0    3    1
#> Duster 360           0    3    4
#> Merc 240D            0    4    2
#> Merc 230             0    4    2
#> Merc 280             0    4    4
#> Merc 280C            0    4    4
#> Merc 450SE           0    3    3
#> Merc 450SL           0    3    3
#> Merc 450SLC          0    3    3
#> Cadillac Fleetwood   0    3    4
#> Lincoln Continental  0    3    4
#> Chrysler Imperial    0    3    4
#> Fiat 128             1    4    1
#> Honda Civic          1    4    2
#> Toyota Corolla       1    4    1
#> Toyota Corona        0    3    1
#> Dodge Challenger     0    3    2
#> AMC Javelin          0    3    2
#> Camaro Z28           0    3    4
#> Pontiac Firebird     0    3    2
#> Fiat X1-9            1    4    1
#> Porsche 914-2        1    5    2
#> Lotus Europa         1    5    2
#> Ford Pantera L       1    5    4
#> Ferrari Dino         1    5    6
#> Maserati Bora        1    5    8
#> Volvo 142E           1    4    2
```

Note that the entire data set is printed. This is annoying and should be avoided. Functions like `as_tibble()` included in the `tibble` library converts the data frame to a tibble, a much nicer data type to work with (in my opinion). We begin by installing and loading the `tibble` library:


```r
# Install tibble package
install.packages('tibble')
# Load tibble package
library(tibble)
```

And then we use the `mtcars` data frame as an input in the `as_tibble()` function.


```r
as_tibble(mtcars)
#> # A tibble: 32 × 11
#>      mpg   cyl  disp    hp  drat    wt  qsec    vs    am
#>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1  21       6  160    110  3.9   2.62  16.5     0     1
#>  2  21       6  160    110  3.9   2.88  17.0     0     1
#>  3  22.8     4  108     93  3.85  2.32  18.6     1     1
#>  4  21.4     6  258    110  3.08  3.22  19.4     1     0
#>  5  18.7     8  360    175  3.15  3.44  17.0     0     0
#>  6  18.1     6  225    105  2.76  3.46  20.2     1     0
#>  7  14.3     8  360    245  3.21  3.57  15.8     0     0
#>  8  24.4     4  147.    62  3.69  3.19  20       1     0
#>  9  22.8     4  141.    95  3.92  3.15  22.9     1     0
#> 10  19.2     6  168.   123  3.92  3.44  18.3     1     0
#> # … with 22 more rows, and 2 more variables: gear <dbl>,
#> #   carb <dbl>
```

There are a few things worth mentioning here: 

1. The data is truncated. We only see the first ten rows and however many columns fit on our page. 

2. We get information about the total number of rows and columns in the tibble.

3. We get the data type of each column. Note the `dbl` underneath the column name.

Since I prefer using the tibble format, I am going to *overwrite* the data frame `mtcars` with its tibble version [recall the discussion from before]:


```r
mtcars <- as_tibble(mtcars)
```

We can refer to specific variables in our tibbles (and data frames) with the `$` operator:


```r
mtcars$mpg
#>  [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8
#> [12] 16.4 17.3 15.2 10.4 10.4 14.7 32.4 30.4 33.9 21.5 15.5
#> [23] 15.2 13.3 19.2 27.3 26.0 30.4 15.8 19.7 15.0 21.4
```

Sometimes we want to access the number of rows and/or columns of our data. We can use the `nrow()` and `ncol()` functions respectively. Alternatively, we can use the `dim()` function to get both simultaneously.


```r
nrow(mtcars)
#> [1] 32
ncol(mtcars)
#> [1] 11
dim(mtcars)
#> [1] 32 11
```

## Summarizing data frames

We can quickly summarize our data with the `summary()` function:


```r
summary(mtcars)
#>       mpg             cyl             disp      
#>  Min.   :10.40   Min.   :4.000   Min.   : 71.1  
#>  1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8  
#>  Median :19.20   Median :6.000   Median :196.3  
#>  Mean   :20.09   Mean   :6.188   Mean   :230.7  
#>  3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0  
#>  Max.   :33.90   Max.   :8.000   Max.   :472.0  
#>        hp             drat             wt       
#>  Min.   : 52.0   Min.   :2.760   Min.   :1.513  
#>  1st Qu.: 96.5   1st Qu.:3.080   1st Qu.:2.581  
#>  Median :123.0   Median :3.695   Median :3.325  
#>  Mean   :146.7   Mean   :3.597   Mean   :3.217  
#>  3rd Qu.:180.0   3rd Qu.:3.920   3rd Qu.:3.610  
#>  Max.   :335.0   Max.   :4.930   Max.   :5.424  
#>       qsec             vs               am        
#>  Min.   :14.50   Min.   :0.0000   Min.   :0.0000  
#>  1st Qu.:16.89   1st Qu.:0.0000   1st Qu.:0.0000  
#>  Median :17.71   Median :0.0000   Median :0.0000  
#>  Mean   :17.85   Mean   :0.4375   Mean   :0.4062  
#>  3rd Qu.:18.90   3rd Qu.:1.0000   3rd Qu.:1.0000  
#>  Max.   :22.90   Max.   :1.0000   Max.   :1.0000  
#>       gear            carb      
#>  Min.   :3.000   Min.   :1.000  
#>  1st Qu.:3.000   1st Qu.:2.000  
#>  Median :4.000   Median :2.000  
#>  Mean   :3.688   Mean   :2.812  
#>  3rd Qu.:4.000   3rd Qu.:4.000  
#>  Max.   :5.000   Max.   :8.000
```

This is a nice way to get a quick feel for the data. 

## Subsetting our data
Let us assume we are interested in a specific subset of the `mtcars` data. We can create a subset of `mtcars` with the columns we are interested in using with the `select()` function from the `dplyr` package. As with the `tibble` package, we have install and then load the `dplyr` package, something I hope you have grown comfortable with at this point:


```r
# Install dplyr
install.packages('dplyr')
# Load dplyr package
library(dplyr)
```

We will now create a subset tibble of the `mtcars` data which will consist of all the rows but *only* variables `mpg`, `hp`, and `wt`, representing miles per gallon, gross horsepower, and weight (1000 lbs) respectively.


```r
smallData <- select(mtcars, mpg, hp, wt)
smallData
#> # A tibble: 32 × 3
#>      mpg    hp    wt
#>    <dbl> <dbl> <dbl>
#>  1  21     110  2.62
#>  2  21     110  2.88
#>  3  22.8    93  2.32
#>  4  21.4   110  3.22
#>  5  18.7   175  3.44
#>  6  18.1   105  3.46
#>  7  14.3   245  3.57
#>  8  24.4    62  3.19
#>  9  22.8    95  3.15
#> 10  19.2   123  3.44
#> # … with 22 more rows
```

Dissecting the `select()` function, we see that first we have to supply the function with the data set we want to subset (in this case `mtcars`) and then list our selected variables. We can also use the `select()` function to throw out variables with the `-` prefix.


```r
throwOutVariables <- select(mtcars, -mpg, -hp, -wt)
throwOutVariables
#> # A tibble: 32 × 8
#>      cyl  disp  drat  qsec    vs    am  gear  carb
#>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1     6  160   3.9   16.5     0     1     4     4
#>  2     6  160   3.9   17.0     0     1     4     4
#>  3     4  108   3.85  18.6     1     1     4     1
#>  4     6  258   3.08  19.4     1     0     3     1
#>  5     8  360   3.15  17.0     0     0     3     2
#>  6     6  225   2.76  20.2     1     0     3     1
#>  7     8  360   3.21  15.8     0     0     3     4
#>  8     4  147.  3.69  20       1     0     4     2
#>  9     4  141.  3.92  22.9     1     0     4     2
#> 10     6  168.  3.92  18.3     1     0     4     4
#> # … with 22 more rows
```

## Creating new variables
There are two ways of making new variables: the `$` operator or the `mutate()` function from the `dplyr` package. Let's create two new variables by randomly drawing numbers from the interval [0, 1].


```r
smallData$var1 <- runif(n = nrow(smallData))
smallData <- mutate(smallData, var2 = runif(n = nrow(smallData)))
smallData
#> # A tibble: 32 × 5
#>      mpg    hp    wt  var1  var2
#>    <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1  21     110  2.62 0.556 0.422
#>  2  21     110  2.88 0.650 0.729
#>  3  22.8    93  2.32 0.152 0.416
#>  4  21.4   110  3.22 0.892 0.769
#>  5  18.7   175  3.44 0.911 0.783
#>  6  18.1   105  3.46 0.496 0.721
#>  7  14.3   245  3.57 0.739 0.401
#>  8  24.4    62  3.19 0.724 0.935
#>  9  22.8    95  3.15 0.927 0.990
#> 10  19.2   123  3.44 0.931 0.638
#> # … with 22 more rows
```

Note how we had to overwrite `smallData` when we used the `mutate()` function. 

## Plotting our data
To create plots we use the `ggplot2` package we installed earlier. We will cover plots in more detail later but for now here is an example of how to create a scatter plot using the `ggplot()` and `geom_point()` functions. 


```r
ggplot(data = smallData, aes(x = var1, y = var2)) + 
    geom_point()
```

<img src="01-lecture1_files/figure-html/unnamed-chunk-19-1.png" width="672" />

## Chaining multiple functions together
So far we have used `select()`, `mutate()`, and `ggplot()` separately but we can actually chain them all together with the pipe operator `%>%` from the package `magrittr`. The use of the pipe became so ubiquitous that it got added to R as a built-in operator in version 4.1. The "base" R pipe is `|>`. 

Let's recreate the plot from the previous section with pipes.


```r
install.packages('magrittr')
library(magrittr)
```


```r
mtcars %>%
    mutate(var1 = runif(nrow(mtcars)), 
           var2 = runif(nrow(mtcars))) %>% 
    select(var1, var2) %>%  # this step is unnecessary
    ggplot(aes(x = var1, y = var2)) + 
        geom_point()
```

<img src="01-lecture1_files/figure-html/unnamed-chunk-21-1.png" width="672" />

## The tidyverse package
Over the course of this lecture we have installed and loaded `ggplot2`, `tibble`, `dplyr`, and `magrittr`. All these packages (and more) belong to the `tidyverse` collection. By loading `tidyverse` you load `ggplot2`, `dplyr`, `tidyr`, `readr`, `purrr`, `tibble`, `stringr`, and `forcats`. You can read more about each package here: https://www.tidyverse.org/packages/

To install and load tidyverse simply run:

```r
install.packages('tidyverse')
library(tidyverse)
```



