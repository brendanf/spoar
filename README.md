
<!-- README.md is generated from README.Rmd. Please edit that file -->

# spoar

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![BioC
status](http://www.bioconductor.org/shields/build/release/bioc/spoar.svg)](https://bioconductor.org/checkResults/release/bioc-LATEST/spoar)
[![R-CMD-check-bioc](https://github.com/brendanf/spoar/workflows/R-CMD-check-bioc/badge.svg)](https://github.com/brendanf/spoar/actions)
[![Codecov test
coverage](https://codecov.io/gh/brendanf/spoar/branch/main/graph/badge.svg)](https://codecov.io/gh/brendanf/spoar?branch=main)
<!-- badges: end -->

[SPOA](https://github.com/rvaser/spoa) is a C++ library for fast
alignment and consensus generation of closely related sequences,
especially used for long, error-containing reads from third generation
sequencers. It allows local, global, and semi-global (overlap)
alignment, using linear, affine, or convex gap penalties, and can also
weight by quality scores. SPOAR is an R wrapper for SPOA.

## Installation instructions

Get the latest stable `R` release from
[CRAN](http://cran.r-project.org/). Then install `spoar` using from
[Bioconductor](http://bioconductor.org/) the following code:

``` r
if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}

BiocManager::install("spoar")
```

And the development version from
[GitHub](https://github.com/brendanf/spoar) with:

``` r
BiocManager::install("brendanf/spoar")
```

## Example

Here is the first basic example from the SPOR README:

``` r
library("spoar")

sequences <- c(
    "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
)

spoaAlign(sequences)
#> [1] "CATAAAAGAACG------T---------AGGTCGCCCGTCCGTAACC-T-GTCG-G-ATCACCGG-AA-A--G-G--A-CC-CGTAAAGTGATAATGAT-------------"
#> [2] "------------------------ATAAAGGCAGTCGCTCTGTAAGC-T-GTCG-A-TTCACCGGAAAGATGGCGTTA-CCACGTAAAGTGATAATGATTAT----------"
#> [3] "-ATCAAAGAACG------T-----------GTAGCCTGTCCGTAATC-T-AGCGCATTTCACACG--AGA---C-----CCGCGTAATGGG---------------------"
#> [4] "------------CGTAAAT---------AGGTAAT-GAT-TATCAT--T-A-C--ATATCACAAC--T-A--G-G----GC-CGT-AT-TAATCATGA-TATCATCA-----"
#> [5] "-------------------GTCGC-TAGAGGCA-T-CGTGAGTC-GC-T--TCC-G--T-ACCGCAAGGATGACG--AGTCACTTAAAGTGATAAT----------------"
#> [6] "---------------------------------------CCGTAACCTTCATCG-G-ATCACCGG-AA-A--G-G--A-CC-CGTAAA-TAGACCTGATTATCATC-TACAT"

spoaConsensus(sequences)
#> [1] "CATCAAAGAACGTAGGTAGCCCGTCCGTAACCTGTCGGATCACCGGAAAGAGGACCCGTAAAGTGATAATGATTATCATCTACAT"
```

## Citation

Below is the citation output from using `citation('spoar')` in R. Please
run this yourself to check for any updates on how to cite **spoar**.

``` r
print(citation("spoar"), bibtex = TRUE)
#> 
#> Furneaux B, Vaser R (2021). _SPOAR: SIMD Partial Order Alignment in R_.
#> doi: 10.18129/B9.bioc.spoar (URL:
#> https://doi.org/10.18129/B9.bioc.spoar),
#> https://github.com/brendanf/spoar/spoar - R package version 0.99.0,
#> <URL: http://www.bioconductor.org/packages/spoar>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {SPOAR: SIMD Partial Order Alignment in R},
#>     author = {Brendan Furneaux and Robert Vaser},
#>     year = {2021},
#>     url = {http://www.bioconductor.org/packages/spoar},
#>     note = {https://github.com/brendanf/spoar/spoar - R package version 0.99.0},
#>     doi = {10.18129/B9.bioc.spoar},
#>   }
#> 
#> Vaser R, Sović I, Nagaranjan N, Šikić M (2017). "Fast and accurate de
#> novo genome assembly from long uncorrected reads." _Genome Research_,
#> *27*, 737-746. doi: 10.1101/gr.214270.116 (URL:
#> https://doi.org/10.1101/gr.214270.116), <URL:
#> https://doi.org/10.1101/gr.214270.116>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Article{,
#>     title = {Fast and accurate de novo genome assembly from long uncorrected reads},
#>     author = {Robert Vaser and Ivan Sović and Niranjan Nagaranjan and Mile Šikić},
#>     year = {2017},
#>     journal = {Genome Research},
#>     volume = {27},
#>     issue = {5},
#>     pages = {737--746},
#>     doi = {10.1101/gr.214270.116},
#>     url = {https://doi.org/10.1101/gr.214270.116},
#>   }
```

Please note that the `spoar` was only made possible thanks to many other
R and bioinformatics software authors, which are cited either in the
vignettes and/or the paper(s) describing this package.

## Code of Conduct

Please note that the `spoar` project is released with a [Contributor
Code of Conduct](http://bioconductor.org/about/code-of-conduct/). By
contributing to this project, you agree to abide by its terms.

## Development tools

-   Continuous code testing is possible thanks to [GitHub
    actions](https://www.tidyverse.org/blog/2020/04/usethis-1-6-0/)
    through *[usethis](https://CRAN.R-project.org/package=usethis)*,
    *[remotes](https://CRAN.R-project.org/package=remotes)*, and
    *[rcmdcheck](https://CRAN.R-project.org/package=rcmdcheck)*
    customized to use [Bioconductor’s docker
    containers](https://www.bioconductor.org/help/docker/) and
    *[BiocCheck](https://bioconductor.org/packages/3.12/BiocCheck)*.
-   Code coverage assessment is possible thanks to
    [codecov](https://codecov.io/gh) and
    *[covr](https://CRAN.R-project.org/package=covr)*.
-   The [documentation website](http://brendanf.github.io/spoar) is
    automatically updated thanks to
    *[pkgdown](https://CRAN.R-project.org/package=pkgdown)*.
-   The code is styled automatically thanks to
    *[styler](https://CRAN.R-project.org/package=styler)*.
-   The documentation is formatted thanks to
    *[devtools](https://CRAN.R-project.org/package=devtools)* and
    *[roxygen2](https://CRAN.R-project.org/package=roxygen2)*.

For more details, check the `dev` directory.

This package was developed using
*[biocthis](https://bioconductor.org/packages/3.12/biocthis)*.
