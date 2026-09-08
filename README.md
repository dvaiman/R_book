# NavigatoR: Plotting Your Course Through R Fundamentals

The course book for **R: från datahantering till visualisering** at GIH,
Swedish School of Sport and Health Sciences.

## About

The book follows the structure of the course lectures and goes into more depth,
with self-marking questions and coding exercises in every chapter.

- **Getting started** — installing R and RStudio, Positron, projects and file
  paths, R basics, classes and objects, Quarto, version control
- **Visualising data** — the grammar of graphics with `ggplot2`
- **Getting data in and out** — importing, exporting, `here()`
- **Data wrangling** — tidy data, `dplyr` verbs, pivoting, joins, strings and
  factors, cleaning messy data
- **Exploring and communicating** — exploratory data analysis, tables, the full
  analysis workflow
- **Beyond the basics** — generative AI, writing functions and iterating with
  `purrr`, useful packages

## Accessing the book

The book is available online at
[dvaiman.github.io/R_book](https://dvaiman.github.io/R_book).

## Building it locally

Requires R (>= 4.1) and [Quarto](https://quarto.org/docs/get-started/).

```r
# install the packages the book uses
install.packages(c(
  "tidyverse", "palmerpenguins", "webexercises", "here", "janitor",
  "patchwork", "skimr", "naniar", "GGally", "Hmisc", "broom",
  "broom.helpers", "gt", "gtsummary", "flextable", "DT", "writexl"
))
```

Then render from the project root:

```bash
quarto render
```

The rendered site is written to `_book/`, which is not tracked in Git — the
GitHub Actions workflow in `.github/workflows/quarto-publish.yml` renders the
book and deploys it to GitHub Pages on every push to `main`.

## Course materials

Lecture slides for the course are at
[dvaiman.github.io/R_from_data_wrangling_to_visualizing](https://github.com/dvaiman/R_from_data_wrangling_to_visualizing).
