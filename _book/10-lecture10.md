# Lecture 10: Miscellaneous


```r
library(tidyverse)
library(cowplot)
library(GGally)
```


## Correlation

### Definition and example
Assume we have $n$ measurements of variables $x$ and $y$. Let $\bar{x}$ and $\bar{y}$ be their means and $s_x$ and $s_y$ their standard deviations. The sample correlation $r$ is then:

$$
r = \frac{1}{n-1}\sum _ {i = 1} ^n \left(  \frac{x_i - \bar{x}}{s_x} \right) \left(  \frac{y_i - \bar{y}}{s_y} \right).
$$

The sample correlation can range from -1 to 1, where we call -1 *perfect negative correlation* and 1 *perfect positive correlation*. If $r = 0$ we say that there is no correlation between $x$ and $y$. Here are a few examples:



<img src="10-lecture10_files/figure-html/unnamed-chunk-3-1.png" width="672" />

### Hypothesis test 
Let us denote the *population* correlation coefficient with $\rho$. We estimate $\rho$ with $r$. A two-sided hypothesis test for $\rho$ is:

$$
\begin{aligned}
H_0 &: \rho = 0 \\
H_1 &: \rho \neq 0
\end{aligned}
$$
The test statistic of the hypothesis test is:
$$
t = \frac{r\sqrt{n - 2}}{\sqrt{1 - r^2}}.
$$

Under the null hypothesis we expect our $t$-statistic to come from a $t$-distribution with $n-2$ degrees of freedom. We can perform this hypothesis test with the `cor.test()` function in R. Let's look at an example using the `mtcars` data. We are going to see if there is a correlation between `mpg` and `hp`.

We begin by plotting the data:


```r
mtcars %>%
    ggplot(aes(x = hp, y = mpg)) +
    geom_point() +
    stat_smooth(method = 'lm', se = F) +
    theme_cowplot()
#> `geom_smooth()` using formula 'y ~ x'
```

<img src="10-lecture10_files/figure-html/unnamed-chunk-4-1.png" width="672" />

Looking at the plot we suspect that there exists a negative correlation between `hp` and `mpg`. That is, the greater the horsepower of the car the less fuel efficient it is. Let's confirm this by running a hypothesis test.


```r
cor.test(mtcars$hp, mtcars$mpg)
#> 
#> 	Pearson's product-moment correlation
#> 
#> data:  mtcars$hp and mtcars$mpg
#> t = -6.7424, df = 30, p-value = 1.788e-07
#> alternative hypothesis: true correlation is not equal to 0
#> 95 percent confidence interval:
#>  -0.8852686 -0.5860994
#> sample estimates:
#>        cor 
#> -0.7761684
```

As you can see we reject the null hypothesis.

### The `ggpairs()` function from `GGally`.
The `ggpairs()` function from the `GGally` package is very useful when we want to look at the correlation between multiple variables. Let's look at the `mtcars` data again. Since `mtcars` has 11 variables I'm going to select four: `mpg`, `hp`, `wt`, and `drat`. 


```r
mtcars %>%
    select(mpg, hp, wt, drat) %>%
    ggpairs() +
    theme_cowplot()
```

<img src="10-lecture10_files/figure-html/unnamed-chunk-6-1.png" width="672" />

There is a lot of information packed into that graph. We see:

1. The density (or distribution) of our variables on the diagonal.

2. The scatter plots of all combinations for the variables.

3. The correlation between the variables and if that correlation is significantly different from 0.

## Interpreting the coefficients of linear regression
Let's fit a linear model on some variables from `mtcars`:


```r
lm1 <- lm(mpg ~ hp + wt + drat, data = mtcars)
summary(lm1)
#> 
#> Call:
#> lm(formula = mpg ~ hp + wt + drat, data = mtcars)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -3.3598 -1.8374 -0.5099  0.9681  5.7078 
#> 
#> Coefficients:
#>              Estimate Std. Error t value Pr(>|t|)    
#> (Intercept) 29.394934   6.156303   4.775 5.13e-05 ***
#> hp          -0.032230   0.008925  -3.611 0.001178 ** 
#> wt          -3.227954   0.796398  -4.053 0.000364 ***
#> drat         1.615049   1.226983   1.316 0.198755    
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 2.561 on 28 degrees of freedom
#> Multiple R-squared:  0.8369,	Adjusted R-squared:  0.8194 
#> F-statistic: 47.88 on 3 and 28 DF,  p-value: 3.768e-11
```

The *equation* of the model is (roughly):

$$
\begin{aligned}
\hat{y} &= \hat{\beta} _ 0 + \hat{\beta} _ 1 \mbox{hp} + \hat{\beta} _ 2 \mbox{wt} + \hat{\beta} _ 3 \mbox{drat} \\
&= 29.39 - 0.032 \mbox{hp} - 3.23 \mbox{wt} + 1.62 \mbox{drat}
\end{aligned}
$$

This is how we interpret the coefficients:

* $\hat{\beta} _ 0$: The value of $\mbox{mpg}$ if $\mbox{hp} = \mbox{wt} = \mbox{drat} = 0$. This is why it is called the *intercept* term.

* $\hat{\beta} _ 1$: The *change* in $\mbox{mpg}$ if we increase $\mbox{hp}$ by one unit and hold $\mbox{wt}$ and $\mbox{drat}$ fixed. The coefficient value for $\hat{\beta} _ 1$ was $-0.032$. That means, all else equal, that we expect $\mbox{mpg}$ to *decrease* by $-0.032$ if we *increase* $\mbox{hp}$ by one unit.

* $\hat{\beta} _ 2$: The *change* in $\mbox{mpg}$ if we increase $\mbox{wt}$ by one unit and hold $\mbox{hp}$ and $\mbox{drat}$ fixed. The coefficient value for $\hat{\beta} _ 2$ was $-3.23$. That means, all else equal, that we expect $\mbox{mpg}$ to *decrease* by $-3.23$ if we *increase* $\mbox{wt}$ by one unit.

* $\hat{\beta} _ 3$: The *change* in $\mbox{mpg}$ if we increase $\mbox{drat}$ by one unit and hold $\mbox{hp}$ and $\mbox{wt}$ fixed. The coefficient value for $\hat{\beta} _ 2$ was $1.62$. That means, all else equal, that we expect $\mbox{mpg}$ to *increase* by $1.62$ if we *increase* $\mbox{drat}$ by one unit.

For those of you with a background in calculus this essentially amounts to taking the derivative of $\hat{y}$ with respect to the variable in question. Using $\mbox{hp}$ as an example:

$$
\begin{aligned}
\frac{d\hat{y}}{d\mbox{hp}} &= \frac{d}{d\mbox{hp}} \left( \hat{\beta} _ 0 + \hat{\beta} _ 1 \mbox{hp} + \hat{\beta} _ 2 \mbox{wt} + \hat{\beta} _ 3 \mbox{drat}\right) \\
&= \hat{\beta} _ 1. 
\end{aligned}
$$

## Hypothesis test for multiple ratios
In lecture 5 we talked about a hypothesis test for *a* ratio. We can generalize this to multiple ratios.

### Two ratios
We begin by loading the `pulse` data:


```r
pulse <- read_csv2('https://notendur.hi.is/thj73/data/pulseEn.csv') %>%
    na.omit()
```

In the pulse data we have the categorical variables `intervention` and `drinks`. Let's create a $2\times 2$ contingency table of those two variables:


```r
# Counts
table(pulse$intervention, pulse$drinks)
#>             
#>               no yes
#>   active      24 145
#>   stationary  41 216
```


```r
# Proportions
prop.table(table(pulse$intervention, pulse$drinks), margin = 1)
#>             
#>                     no       yes
#>   active     0.1420118 0.8579882
#>   stationary 0.1595331 0.8404669
```

We can see proportion of non-drinkers in the stationary and active groups is 14% and 15.9% respectively. Let's assume we want to see if there is enough statical evidence to test if these two proportions differ from each other. The hypothesis test is:

$$
\begin{aligned}
H_0&: p_1 = p_2 \\
H_1&: p_1 \neq p_2
\end{aligned}
$$

The test statistic of this hypothesis test comes from the $\chi ^2$ distribution with one degree of freedom if the null hypothesis is true. Computing it by hand is quite involved so instead we will let $R$ do it for us with the `prop.test()` function. 


```r
prop.test(table(pulse$intervention, pulse$drinks))
#> 
#> 	2-sample test for equality of proportions with
#> 	continuity correction
#> 
#> data:  table(pulse$intervention, pulse$drinks)
#> X-squared = 0.12553, df = 1, p-value = 0.7231
#> alternative hypothesis: two.sided
#> 95 percent confidence interval:
#>  -0.09151773  0.05647526
#> sample estimates:
#>    prop 1    prop 2 
#> 0.1420118 0.1595331
```

Look at the output of the `prop.test()` function; as you can see we are comparing the proportion of active non-drinkers to stationary non-drinkers. The $p$-value exceeds $\alpha = 0.05$ and we are therefore unable to reject the null hypothesis.

### More ratios
The $\chi ^2$ test we just performed can be generalized to more proportions. Assume we have $q$ proportions we want to compare. The hypothesis test in is now:

$$
\begin{aligned}
H_0&: p_1 = p_2 = \ldots p_q \\
H_1&: \mbox{at least one } p_i \mbox{ differs}
\end{aligned}
$$

Note the similarity with the ANOVA model. The difference here is that we are concerned about proportions rather than means. The test just tells us *if* there is a difference but not *where* the difference is. There exist post-hoc methods to then see where the difference lies the most basic one being Bonferroni corrections.

The test statistic for this hypothesis test also comes from the $\chi ^2$ distribution if the null hypothesis is true. The only difference is the number of degrees of freedom which can be computed as $(l - 1) \cdot (d - 1)$ where $d$ is number of columns in the contingency table and $l$ is the number of lines in the contingency table. Let's work through an example.

In the `ISLR` package there is a data set called `Wage`.


```r
wage <- ISLR::Wage
```

This data set has 11 columns and 3000 lines. We are interested in two variables in particular: `race` and `jobclass`. Let's reduce our data to only include those variables.


```r
wage <-
    wage %>%
    select(race, jobclass)
```

Let's create a table of the data:


```r
table(wage$race, wage$jobclass)
#>           
#>            1. Industrial 2. Information
#>   1. White          1325           1155
#>   2. Black           111            182
#>   3. Asian            86            104
#>   4. Other            22             15
```
Our table consists of four lines ($l = 4$) and two ($d = 2$) columns. Let's look at the proportions again:


```r
prop.table(table(wage$race, wage$jobclass), margin = 1)
#>           
#>            1. Industrial 2. Information
#>   1. White     0.5342742      0.4657258
#>   2. Black     0.3788396      0.6211604
#>   3. Asian     0.4526316      0.5473684
#>   4. Other     0.5945946      0.4054054
```

Let's assume we are interested in seeing if there is a difference in the proportions of races within job types.


```r
prop.test(table(wage$race, wage$jobclass))
#> 
#> 	4-sample test for equality of proportions without
#> 	continuity correction
#> 
#> data:  table(wage$race, wage$jobclass)
#> X-squared = 29.331, df = 3, p-value = 1.908e-06
#> alternative hypothesis: two.sided
#> sample estimates:
#>    prop 1    prop 2    prop 3    prop 4 
#> 0.5342742 0.3788396 0.4526316 0.5945946
```

The degrees of freedom are three which fits in the formula $(l - 1) \cdot (d - 1) = 3 \cdot 1$. The $p$-value is smaller than $\alpha = 0.05$ so we can reject the null hypothesis. There seems to be a difference between the ratios but we don't know where. A natural next step would be a post-hoc analysis.

## The $F$-distribution
The test statistic of the hypothesis test of the ANOVA model is the $F$-statistic. Under the null hypothesis the $F$-statistic should come from the $F$-distribution. The $F$-distribution has two parameters: df$^1$ and df$^2$ where df stands for degrees of freedom. The two parameters determine the shape of the $F$-distribution:


```r
tibble(f = seq(0.01, 5, by = 0.01), 
       d1 = df(x = f, df1 = 1, df2 = 1), 
       d2 = df(x = f, df1 = 2, df2 = 1 ), 
       d3 = df(x = f, df1 = 5, df2 = 2), 
       d4 = df(x = f, df1 = 100, df2 = 100)) %>%
    gather(dist, val, -f) %>%
    mutate(dist = factor(dist, 
                         levels = c('d1', 'd2', 'd3', 'd4'), 
                         labels = c('df1 = 1, df2 = 1', 
                                    'df1 = 2, df2 = 1', 
                                    'df1 = 5, df2 = 2', 
                                    'df1 = 100, df2 = 100'))) %>%
    ggplot(aes(x = f, y = val, color = dist, lty = dist)) +
    geom_line() +
    labs(x = 'F', y = '', color = '', lty = '') +
    scale_color_brewer(type = 'seq', palette = 'Set1') +
    theme_cowplot() +
    theme(legend.position = 'bottom')
```

<img src="10-lecture10_files/figure-html/unnamed-chunk-17-1.png" width="672" />

