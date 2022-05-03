# 360info report template

This analysis visualises the reported incidence of various forms of violence against female journlists in Indonesia.

## Use + Remix rights

![[Creative Commons Attribution 4.0](https://creativecommons.org/licenses/by/4.0)](https://mirrors.creativecommons.org/presskit/buttons/80x15/png/by.png)

These charts, as well as the analyses that underpin them, are available under a Creative Commons Attribution 4.0 licence. This includes commercial reuse and derivates.

Data in these charts comes from:

* [PR2Media, 2022. Violence Against Female Journlists in Indonesia: A Threat to Journalism and Freedom of the Press](https://pr2media.or.id/wp-content/uploads/2022/04/Violence-Against-Female-Journalists-In-Indonesia.pdf)

This research has been possible owing to the support of the people of the United States of America through USAID. PR2Media is fully responsible for the content of this report, and it does not in any way reflect the views of Internews, USAID, or the Government of the United States of America.

Data additional to the report was provided to 360info by PR2Media. Code relating to the aggregation of the data is available in [`survey-aggregate.r`](./survey-aggregate.r), but 360info has chosen not to publish the deidentified data to protect participants' privacy.

**Please attribute 360info and the data sources when you use and remix these visualisations.**

## Reproduce the analysis

We typically publish graphics using [Quarto](https://quarto.org) notebooks, which can be found in the`*.qmd` files. Quarto allows reproducible analysis and visualisation to be done in a mix of languages, but we typically use [R](https://r-project,.org) and [Observable JS](https://observablehq.com/@observablehq/observables-not-javascript).

You'll need to:
- [Download and install Quarto](https://quarto.org/docs/get-started)
- [Download the install R](https://www.r-project.org)
- Satisfy the R package dependencies. In R:
  * Install the [`renv`](https://rstudio.github.io/renv) package with `install.packages("renv")`,
  * Then run `renv::restore()` to install the R package dependencies.
  * (For problems satisfying R package dependencies, refer to [Quarto's documentation on virtual environments](https://quarto.org/docs/projects/virtual-environments.html).)

Now, render the `.qmd` files to the `/out` directory with:

```sh
quarto render --output-dir out index.qmd
```

## Help

<!-- replace `report-template` with the name of this repo in the link below  -->

If you find any problems with our analysis or charts, please feel free to [create an issue](https://github.com/360-info/report-press-freedom/issues/new)!
