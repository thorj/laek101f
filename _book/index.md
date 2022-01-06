--- 
title: "A Minimal Book Example"
author: "John Doe"
date: "2022-01-05"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
# url: your book url like https://bookdown.org/yihui/bookdown
# cover-image: path to the social sharing image like images/cover.jpg
description: |
  This is a minimal example of using the bookdown package to write a book.
  The HTML output format for this example is bookdown::bs4_book,
  set in the _output.yml file.
biblio-style: apalike
csl: chicago-fullnote-bibliography.csl
---


```r
library(tidyverse)
library(knitr)
library(kableExtra)
options(browser = "firefox")
```

# Course information

## About me

### Education

- B.Sc. economics [2017] and applied mathematics [2020]
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

## Class and workshop schedule

Class schedule can be seen in the following table. Important dates are marked in blue.

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:center;"> Week </th>
   <th style="text-align:center;"> Date </th>
   <th style="text-align:center;"> Day </th>
   <th style="text-align:center;"> Time slot </th>
   <th style="text-align:center;"> Location </th>
   <th style="text-align:center;"> Material </th>
   <th style="text-align:center;"> Remarks </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> 1 </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> 7 Feb </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> Mon </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> H-205 </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;">  </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 8 Feb </td>
   <td style="text-align:center;"> Tue </td>
   <td style="text-align:center;"> 09:10 - 11:30 </td>
   <td style="text-align:center;"> H-205 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 9 Feb </td>
   <td style="text-align:center;"> Wed </td>
   <td style="text-align:center;"> 09:10 - 11:30 </td>
   <td style="text-align:center;"> H-205 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 10 Feb </td>
   <td style="text-align:center;"> Thur </td>
   <td style="text-align:center;"> 09:10 - 11:30 </td>
   <td style="text-align:center;"> H-205 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 11 Feb </td>
   <td style="text-align:center;"> Fri </td>
   <td style="text-align:center;"> 09:10 - 11:30 </td>
   <td style="text-align:center;"> H-203 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> 2 </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> 14 Feb </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> Mon </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> H-203 </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;">  </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 15 Feb </td>
   <td style="text-align:center;"> Tue </td>
   <td style="text-align:center;"> 09:10 - 11:30 </td>
   <td style="text-align:center;"> H-205 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 16 Feb </td>
   <td style="text-align:center;"> Wed </td>
   <td style="text-align:center;"> 09:10 - 11:30 </td>
   <td style="text-align:center;"> H-205 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 17 Feb </td>
   <td style="text-align:center;"> Thur </td>
   <td style="text-align:center;"> 09:10 - 11:30 </td>
   <td style="text-align:center;"> H-205 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 18 Feb </td>
   <td style="text-align:center;"> Fri </td>
   <td style="text-align:center;"> 09:10 - 11:30 </td>
   <td style="text-align:center;"> H-205 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> 3 </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> 21 Feb </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> Mon </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> H-203 </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;">  </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 22 Feb </td>
   <td style="text-align:center;"> Tue </td>
   <td style="text-align:center;"> 09:10 - 11:30 </td>
   <td style="text-align:center;"> H-204 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 23 Feb </td>
   <td style="text-align:center;"> Wed </td>
   <td style="text-align:center;"> 09:10 - 11:30 </td>
   <td style="text-align:center;"> H-205 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 24 Feb </td>
   <td style="text-align:center;"> Thur </td>
   <td style="text-align:center;"> 09:10 - 11:30 </td>
   <td style="text-align:center;"> H-205 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 25 Feb </td>
   <td style="text-align:center;"> Fri </td>
   <td style="text-align:center;"> 09:10 - 11:30 </td>
   <td style="text-align:center;"> H-205 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> 4 </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> 28 Feb </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> Mon </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> 09:10 - 11:30 </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> H-205 </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;"> Final </td>
   <td style="text-align:center;font-weight: bold;color: white !important;background-color: #6699CC !important;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 1 Mar </td>
   <td style="text-align:center;"> Tue </td>
   <td style="text-align:center;"> 09:10 - 11:30 </td>
   <td style="text-align:center;"> H-205 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
</tbody>
</table>

Workshop schedule can been seen in the following table. **Student's are strongly encouraged to utilize the workshops!**

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:center;"> Date </th>
   <th style="text-align:center;"> Day </th>
   <th style="text-align:center;"> Time slot </th>
   <th style="text-align:center;"> Location </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> 7 Feb </td>
   <td style="text-align:center;"> Tue </td>
   <td style="text-align:center;"> 12:30 - 14:00 </td>
   <td style="text-align:center;"> H-204 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 8 Feb </td>
   <td style="text-align:center;"> Wed </td>
   <td style="text-align:center;"> 12:30 - 14:00 </td>
   <td style="text-align:center;"> H-203 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 11 Feb </td>
   <td style="text-align:center;"> Fri </td>
   <td style="text-align:center;"> 12:30 - 14:00 </td>
   <td style="text-align:center;"> H-203 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 14 Feb </td>
   <td style="text-align:center;"> Mon </td>
   <td style="text-align:center;"> 12:30 - 14:00 </td>
   <td style="text-align:center;"> H-203 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 15 Feb </td>
   <td style="text-align:center;"> Tue </td>
   <td style="text-align:center;"> 12:30 - 14:00 </td>
   <td style="text-align:center;"> H-204 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 21 Feb </td>
   <td style="text-align:center;"> Man </td>
   <td style="text-align:center;"> 12:30 - 14:00 </td>
   <td style="text-align:center;"> H-203 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 22 Feb </td>
   <td style="text-align:center;"> Tue </td>
   <td style="text-align:center;"> 12:30 - 14:00 </td>
   <td style="text-align:center;"> H-204 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 23 Feb </td>
   <td style="text-align:center;"> Wed </td>
   <td style="text-align:center;"> 12:30 - 14:00 </td>
   <td style="text-align:center;"> H-203 </td>
  </tr>
</tbody>
</table>


## Textbooks

- Textbooks in English:
  - [*Modern Dive*](https://moderndive.com/) (MD)
  - [*R for Data Science*](https://r4ds.had.co.nz/) (R4DS)
  - [*Statistical Thinking for the 21st Century*](https://statsthinking21.github.io/statsthinking21-core-site/) (ST21)

- Textbooks in Icelandic:
  - [*Tölfræði frá grunni*](https://edbook.hi.is/tolfraedi_fra_grunni/) (TG)
  - [*R frá grunni*](https://edbook.hi.is/R_fra_grunni/) (RG)
  
## Software

- [*R*](https://www.r-project.org/)
- [*RStudio*](https://www.rstudio.com/)

## Course grades

- Four assignments in R, each worth 10% of your final grade.
- Two home assignments, each worth 10% of your final grade.
- Final exam worth 40% of your final grade.

You **must** get a score of 5/10 or higher on your final exam to finish this course.

## Final exam eligibility

- You need to hand in **all** four R assignments and **both** home assignments to be eligible for the final exam.


```r
bookdown::render_book()
```

To render this example to PDF as a `bookdown::pdf_book`, you'll need to install XeLaTeX. You are recommended to install TinyTeX (which includes XeLaTeX): <https://yihui.org/tinytex/>.

## Preview book

As you work, you may start a local server to live preview this HTML book. This preview will update as you edit the book when you save individual .Rmd files. You can start the server in a work session by using the RStudio add-in "Preview book", or from the R console:


```r
bookdown::serve_book()
```

