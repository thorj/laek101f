--- 
title: "LÆK101F: General statistics, course for M.Sc. and Ph.D students "
author: "Þórarinn Jónmundsson"
date: "2022-02-22"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
description: |
  This is a minimal example of using the bookdown package to write a book.
  The HTML output format for this example is bookdown::bs4_book,
  set in the _output.yml file.
biblio-style: apalike
csl: chicago-fullnote-bibliography.csl
---

# General information


```r
library(tidyverse)
library(knitr)
library(kableExtra)
```

## Instructors

- Lectures: Þórarinn Jónmundsson (thj73@hi.is)
- Workshops: 
- Supervision: Thor Aspelund (thor@hi.is)

## About me

### Education

- B.Sc. economics [2017]; B.Sc. applied mathematics [2020]
- M.Sc. mathematical statistics [2020]
- Ph.D. biostatistics [current]

Research project: Identifying causal candidate proteins in cardiometabolic disease

### Previous teaching experience

- Teacher assistant:
  * Introduction to probability and statistics (STÆ203G)
  * Linear algebra (STÆ107G)
  * Bayesian data analysis (STÆ529M)
  * Applied linear statistical models (STÆ312M)
  * R for beginners (MAS103M)
  * Statistical consulting (MAS201M)

- Lecturer
  - Applied linear statistical models (STÆ312M)
  
### Contact information

- Email: thj73@hi.is
- Office: Læknagarður (Lg-306)
- Mobile: 698-2126

## Course description
Compulsory course. The aim of the course is to provide post graduate students with practical and generic skills required in research. Items covered in the course are descriptive statistics, effect statistics, validity and reliability, inferential statistics, common parametric and nonparametric statistical tests and multiple regression analysis. The students are introduced to computer statistical analysis in practical computer classes.

## Learning outcomes
That students:

- Understand the basic concepts of statistics and data analysis.
- Can apply basic statistical methods to data analysed in their thesis.
- Can understand and criticize statistical analysis of data in health research.
- Are literate in R.
- Understand the theory behind various statistical calculations, and are able to apply this knowledge in the analysis of data.

## Textbooks
The lecture notes are based on the following texts:

- Textbooks in English:
  - [*Modern Dive*](https://moderndive.com/) (MD)
  - [*R for Data Science*](https://r4ds.had.co.nz/) (R4DS)
  - [*Statistical Thinking for the 21st Century*](https://statsthinking21.github.io/statsthinking21-core-site/) (ST21)

- Textbooks in Icelandic:
  - [*Tölfræði frá grunni*](https://edbook.hi.is/tolfraedi_fra_grunni/) (TG)
  - [*R frá grunni*](https://edbook.hi.is/R_fra_grunni/) (RG)
  
It should be sufficient to read the lecture notes but those that are interested can read the books themselves at their own pace.

## Software

- [*R*](https://www.r-project.org/)
- [*RStudio*](https://www.rstudio.com/)

## Lectures and workshops
Lectures will be from 9:10-11:30 and workshops from 12:30 to 14:00. All **lectures** will be recorded and streamed.. Lecture and workshop attendance is **not** mandatory. **Student's are strongly encouraged to utilize the workshops!**. 

Below you can see a rough plan for the course. Depending on how the course goes it may be subject to change. Lectures marked as *open* might be used as extra lecture or workshop slots.  

### Tentative lecture schedule 

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:center;"> Week </th>
   <th style="text-align:center;"> Date </th>
   <th style="text-align:center;"> Day </th>
   <th style="text-align:center;"> Time slot </th>
   <th style="text-align:center;"> Location </th>
   <th style="text-align:center;"> Topic </th>
   <th style="text-align:center;"> Suggested reading </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 1 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 7 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> Mon </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> H-205 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;">  </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 1 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 8 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> Tue </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> H-205 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> Introduction, setting up R and RStudio </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> RG: 1-2; TG: 1-2; MD: 1-4; ST21: 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 1 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 9 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> Wed </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> H-205 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> Descriptives, plots, reproducible research </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> RG: 3-4; TG: 3-4; MD: 3, A; ST21: 2-4, 17 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 1 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 10 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> Thur </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> H-205 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> Descriptives, plots, reproducible research </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> RG: 3-4; TG: 3-4; MD: 3, A; ST21: 2-4, 17 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 1 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 11 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> Fri </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> H-203 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> Open </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 2 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 14 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> Mon </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> H-203 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> Probability theory </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> RG: 5; TG: 5; MD: 7-9; ST21: 5-9 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 2 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 15 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> Tue </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> H-205 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> Inference </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> RG: 6; TG: 6; MD: 7-9; ST21: 5-9 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 2 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 16 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> Wed </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> H-205 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> Inference cont. </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> RG: 7-9; TG: 7-9; MD: 7-9; ST21: 5-9 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 2 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 17 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> Thur </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> H-205 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> ANOVA </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> RG: 10; TG: 10; MD: 7-9, ST21: 5-9 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 2 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 18 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> Fri </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> H-205 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> Simple linear regression </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 3 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 21 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> Mon </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> H-203 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> Linear regression </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> RG: 11; TG: 11 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 3 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 22 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> Tue </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> H-204 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> Diagnostics </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 3 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 23 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> Wed </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> H-205 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> Open </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 3 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 24 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> Thur </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> H-205 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> Logistic regression </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 3 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 25 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> Fri </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> H-205 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> Open </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;color: white !important;background-color: #0570B0 !important;"> 4 </td>
   <td style="text-align:center;color: white !important;background-color: #0570B0 !important;"> 28 Feb </td>
   <td style="text-align:center;color: white !important;background-color: #0570B0 !important;"> Mon </td>
   <td style="text-align:center;color: white !important;background-color: #0570B0 !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: white !important;background-color: #0570B0 !important;"> H-205 </td>
   <td style="text-align:center;color: white !important;background-color: #0570B0 !important;"> Open </td>
   <td style="text-align:center;color: white !important;background-color: #0570B0 !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;color: white !important;background-color: #0570B0 !important;"> 4 </td>
   <td style="text-align:center;color: white !important;background-color: #0570B0 !important;"> 1 Mar </td>
   <td style="text-align:center;color: white !important;background-color: #0570B0 !important;"> Tue </td>
   <td style="text-align:center;color: white !important;background-color: #0570B0 !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;color: white !important;background-color: #0570B0 !important;"> H-205 </td>
   <td style="text-align:center;color: white !important;background-color: #0570B0 !important;"> Final exam </td>
   <td style="text-align:center;color: white !important;background-color: #0570B0 !important;">  </td>
  </tr>
</tbody>
</table>

### Workshop schedule

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:center;"> Week </th>
   <th style="text-align:center;"> Date </th>
   <th style="text-align:center;"> Day </th>
   <th style="text-align:center;"> Time slot </th>
   <th style="text-align:center;"> Location </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 1 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 8 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> Tue </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 12:30 - 14:00 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> H-204 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 1 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 9 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> Wed </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 12:30 - 14:00 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> H-203 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 1 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 11 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> Fri </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> 12:30 - 14:00 </td>
   <td style="text-align:center;color: black !important;background-color: #F1EEF6 !important;"> H-203 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 2 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 14 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> Mon </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 12:30 - 14:00 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> H-203 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 2 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 15 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> Tue </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> 12:30 - 14:00 </td>
   <td style="text-align:center;color: black !important;background-color: #BDC9E1 !important;"> H-204 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 3 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 21 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> Man </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 12:30 - 14:00 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> H-203 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 3 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 22 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> Tue </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 12:30 - 14:00 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> H-204 </td>
  </tr>
  <tr>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 3 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 23 Feb </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> Wed </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> 12:30 - 14:00 </td>
   <td style="text-align:center;color: black !important;background-color: #74A9CF !important;"> H-203 </td>
  </tr>
</tbody>
</table>
## Grading
Your final grade in the class is based on the following partition:

- Four assignments in R, *each* worth 10% of your final grade.
- Two longer assignments, *each* worth 10% of your final grade.
- A final exam which will be worth 40% of your final grade.

You **must** get a score of 5/10 or higher on your final exam to finish this course.

## Assignments
Below is the schedule for the assignments. You are encouraged to form groups of 2-4 people to solve the assignments. If you choose to do so, please hand in only one solution per group.

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:center;"> Assignment </th>
   <th style="text-align:center;"> Type </th>
   <th style="text-align:center;"> Assigned </th>
   <th style="text-align:center;"> Due </th>
   <th style="text-align:center;"> Topics </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> R </td>
   <td style="text-align:center;"> Feb 7th </td>
   <td style="text-align:center;"> Feb 10th </td>
   <td style="text-align:center;"> R basics </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> Longer </td>
   <td style="text-align:center;"> Feb 10th </td>
   <td style="text-align:center;"> Feb 16th </td>
   <td style="text-align:center;"> Data analysis </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> R </td>
   <td style="text-align:center;"> Feb 14th </td>
   <td style="text-align:center;"> Feb 17th </td>
   <td style="text-align:center;"> Fundamentals of statistics </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> R </td>
   <td style="text-align:center;"> Feb 14th </td>
   <td style="text-align:center;"> Feb 20th </td>
   <td style="text-align:center;"> ANOVA </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5 </td>
   <td style="text-align:center;"> Longer </td>
   <td style="text-align:center;"> Feb 18th </td>
   <td style="text-align:center;"> Feb 25th </td>
   <td style="text-align:center;"> General regression </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;"> R </td>
   <td style="text-align:center;"> Feb 23rd </td>
   <td style="text-align:center;"> Feb 26th </td>
   <td style="text-align:center;"> Logistic regression </td>
  </tr>
</tbody>
</table>

## Final exam
The final exam is a take-home exam which will be handed out March 1st. 

### Final exam eligibility

- You need to hand in **all** four R assignments and **both** home assignments to be eligible to take the final exam.

