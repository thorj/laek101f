# Lecture 6: ANOVA



In the previous lecture we used the $t$-test to compare the means of two groups. A natural extension of that test is to ask what we should do when we have *multiple* groups. Rather than perform a $t$-test for every single group difference we will use a staticial method called analysis of variance or ANOVA.

## The assumptions of ANOVA
The assumptions of ANOVA are as follows:

1. Our samples are random samples.

2. The underlying populations are normally distributed.

3. The variances of the populations are the same.

## One-way ANOVA
We begin with a short example. Imagine we have developed a new drug that reduces some biomarker. We are interested in testing two things:

1. Our drug works (outperforms placebo).

2. Compare the efficacy of our drug to another drug.

For our study we randomly assign the participants to one of three groups: P (placebo), O (old drug), and N (new drug). We then draw blood twice, once before and once after having administered the treatment and measure our biomarker. Once we have measured both biomarkers we compute the difference between the two measurements for both participants. This is what our data looks like:


```r
set.seed(12)
bioData <- 
    tibble(P1 = rnorm(10, 7, 1), 
       P2 = rnorm(10, 7, 1),
       O1 = rnorm(10, 7, 1), 
       O2 = rnorm(10, 5, 1), 
       N1 = rnorm(10, 7, 1), 
       N2 = rnorm(10, 4, 1)) %>%
    mutate(P = P1 - P2, O = O1 - O2, N = N1 - N2) %>%
    select(P, O, N)
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> P </th>
   <th style="text-align:right;"> O </th>
   <th style="text-align:right;"> N </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> -0.7028480 </td>
   <td style="text-align:right;"> 1.549660 </td>
   <td style="text-align:right;"> 3.1476691 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2.8710518 </td>
   <td style="text-align:right;"> 1.935166 </td>
   <td style="text-align:right;"> 1.9566777 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -0.1771780 </td>
   <td style="text-align:right;"> 3.553008 </td>
   <td style="text-align:right;"> 3.1213074 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -0.9319570 </td>
   <td style="text-align:right;"> 2.768033 </td>
   <td style="text-align:right;"> -0.6159605 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1.8452259 </td>
   <td style="text-align:right;"> 1.347212 </td>
   <td style="text-align:right;"> 3.7423864 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0.4311682 </td>
   <td style="text-align:right;"> 2.217757 </td>
   <td style="text-align:right;"> 2.7148138 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1.5042279 </td>
   <td style="text-align:right;"> 1.526110 </td>
   <td style="text-align:right;"> 1.4836970 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -0.9687675 </td>
   <td style="text-align:right;"> 2.610635 </td>
   <td style="text-align:right;"> 4.5042707 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -0.6134321 </td>
   <td style="text-align:right;"> 1.347695 </td>
   <td style="text-align:right;"> 3.9814921 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 0.7213200 </td>
   <td style="text-align:right;"> 3.366516 </td>
   <td style="text-align:right;"> 2.1931963 </td>
  </tr>
</tbody>
</table>

Let's plot our data to get a better sense for it. The red dots represent the group means while the black dots represent the data itself. The broken line running across the plot is the overall mean.


```r
bioLong <- 
    bioData %>%
    gather(treatment, value) %>%
    mutate(treatment = factor(treatment, levels = c('P', 'O', 'N')))
bioMeans <-
    bioLong %>%
    group_by(treatment) %>%
    summarize(mean = mean(value))
bioLong %>%
    ggplot(aes(x = treatment, y = value)) +
    geom_point() + 
    geom_point(data = bioMeans %>% rename(value = mean), col = 'red') +
    geom_hline(yintercept = mean(bioLong$value), lty = 2) +
    theme_cowplot() +
    labs(x = 'Treatment groups', y = 'Values')
```

<img src="06-lecture6_files/figure-html/unnamed-chunk-4-1.png" width="672" />

From the plot we immediately see that there is a difference between the placebo group and the two drug groups. What is not as clear is whether there is a difference between the two drugs. Finally, it seems that variance is approximately the same between the groups. At this point you should know that eyeballing is not sufficient. 

## Mathematical notation for one-way ANOVA

* $y_ {ij}$ :  $i$ is the index of the group and $j$ is the index of a measurement within the group

* $a$ :  total number of groups

* $n_ i$ : total number of measurements within group $i$

* $N$ : total number of measurements such that
  $$
    N = n_1 + n_2 + \ldots + n_a
  $$

* $\bar{y}_ {i.}$: The *within group* mean:

  $$
    \bar{y}_ {i.} = \frac{\sum _ {j = 1} ^{n_i} y_ {ij}}{n_i}
  $$

* $\bar{y}_ {..}$ : The *grand* mean or *overall* mean. This is the mean of the entire data set.

  $$
    \bar{y}_ {..} = \frac{\sum _{i = 1} ^a \sum _{j = 1}^{n_i} y_ {ij}}{N}
  $$

* $SS_T$: This is a measure of the total variation in the data:

  $$
    SS_T = \sum _{i = 1} ^a \sum _{j = 1} ^{n _i} (y _{ij} - \bar{y} _{..})^2
  $$

* $SS_{Tr}$: This is a measure of the variation *between* treatments:

  $$
    SS_{Tr} = \sum _{i = 1} ^a n_i (\bar{y} _{i.} - \bar{y} _{..})^2
  $$

* $SS_E$: This is a measure of the variation *within* the treatments:

  $$
    SS_E = \sum ^a _{i = 1} \sum _{j = 1} ^{n_i} (y_{ij} - \bar{y}_{i.})^2
  $$

## The one-way ANOVA table
It is common to put the square sums of variation $SS_T, SS_{Tr}, SS_E$ in a table:

$$
\begin{array}{c}
\mbox{Square sums} & \mbox{Degrees of freedom} & \mbox{Mean square sums} \\
SS_{Tr} & a - 1 & MS_{Tr} = SS_{Tr}/(a - 1) \\
SS_{E} & N - a & MS_{E} = SS_{E}/(N - a) \\
SS_{T} & N - 1 & 
\end{array}
$$

The ANOVA table is used to perform hypothesis tests within the ANOVA paradigm. 

## Hypothesis tests with ANOVA
The null hypothesis of the one-way ANOVA is:

$$
H_0 = \mu _ 1 = \mu _ 2 = \ldots = \mu _ a
$$

The alternative hypothesis is:

$$
H_1 = \mbox{ At least one mean differs from the others}
$$i

The *test statistic* is:
$$
F = \frac{SS_{Tr}/(a - 1)}{SS_E/(N - a)} = \frac{MS_{Tr}}{MS_E}
$$

We denote the $F$-statistic with an $F$ because under the null hypothesis it should come from the $F$ distribution with $a - 1$ and $N - a$ degrees of freedom. If we are successful at rejecting the null that means that there evidence for at least one mean differing from the others.

## ANOVA in R
Having covered the theort it's time to use R to perform the ANOVA analysis for us. We will use the biomarker drug from above. The first thing we do is create the ANOVA object in R with the `aov` function:


```r
anovaObj <- aov(value ~ treatment, data = bioLong)
```

The next thing we do is create the ANOVA table with the `anova()` function.


```r
anova(anovaObj)
#> Analysis of Variance Table
#> 
#> Response: value
#>           Df Sum Sq Mean Sq F value    Pr(>F)    
#> treatment  2 49.208 24.6040  15.723 2.967e-05 ***
#> Residuals 27 42.252  1.5649                      
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

As you can see we get the first two rows of the ANOVA table. The $p$-value is small meaning that we reject the null hypothesis at the $\alpha = 0.05$ significance level. The value of our $F$-statistic is 15.7226097. 

So we have successfully rejected the null hypothesis but that only tells us that there *exists* a difference but not *where* the difference lies. For that we need to do some post-hoc analyses such as the Tukey's multiple comparison test.


```r
TukeyHSD(anovaObj)
#>   Tukey multiple comparisons of means
#>     95% family-wise confidence level
#> 
#> Fit: aov(formula = value ~ treatment, data = bioLong)
#> 
#> $treatment
#>          diff        lwr      upr     p adj
#> O-P 2.4941887  1.1070959 3.881282 0.0003727
#> N-P 2.8949646  1.5078718 4.282057 0.0000552
#> N-O 0.4007759 -0.9863169 1.787869 0.7560053
```

Here we see that each comparison has been tested for us. We see that both the old and the new drug differ from the placebo. Unfortunately when the new drug was compared to the old drug we failed to reject the null hypothesis. We can therefore not claim that our drug is an improvement.

We can also graph the comparisons:


```r
plot(TukeyHSD(anovaObj))
```

<img src="06-lecture6_files/figure-html/unnamed-chunk-8-1.png" width="672" />

## A glimpse of what is to come
There is an alternative way to perform the ANOVA analysis. We can simply use the linear regression function (the subject of the next lecture) `lm()`.


```r
linearFit <- lm(value ~ treatment, data = bioLong)
summary(linearFit)
#> 
#> Call:
#> lm(formula = value ~ treatment, data = bioLong)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -3.2389 -0.6902 -0.1457  0.6638  3.1431 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)  -0.2720     0.3956  -0.688  0.49756    
#> treatmentO    2.4942     0.5594   4.458  0.00013 ***
#> treatmentN    2.8950     0.5594   5.175  1.9e-05 ***
#> ---
#> Signif. codes:  
#> 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 1.251 on 27 degrees of freedom
#> Multiple R-squared:  0.538,	Adjusted R-squared:  0.5038 
#> F-statistic: 15.72 on 2 and 27 DF,  p-value: 2.967e-05
```

There is a lot of information packed in this summary but if you look at the bottom we see that we have the same $F$-statistic, degrees of freedom and $p$-value.

