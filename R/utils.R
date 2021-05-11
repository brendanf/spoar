## Brendan Furneaux
## May 2021

## assertthat tests for nonpositive and nonnegative scalar integer(ish)s
isNonpositiveInt <- function(x) {
    !is.null(x) && length(x) == 1L && is.numeric(x) && x == round(x) && x <= 0
}
assertthat::on_failure(isNonpositiveInt) <- function(call, env) {
    paste0(deparse(call$x), " is not a single non-positive integer.")
}

isNonnegativeInt <- function(x) {
    !is.null(x) && length(x) == 1L && is.numeric(x) && x == round(x) && x >= 0
}
assertthat::on_failure(isNonnegativeInt) <- function(call, env) {
    paste0(deparse(call$x), " is not a single non-negative integer.")
}


## convert a character vector into an XString of type matching xss
matchXString <- function(x, xss) {
    if (methods::is(xss, "DNAStringSet")) {
        Biostrings::DNAString(x)
    } else if (methods::is(xss, "RNAStringSet")) {
        Biostrings::RNAString(x)
    } else if (methods::is(xss, "AAStringSet")) {
        Biostrings::AAString(x)
    } else {
        Biostrings::BString(x)
    }
}

matchXMultipleAlignment <- function(x, xss) {
    if (methods::is(xss, "DNAStringSet")) {
        Biostrings::DNAMultipleAlignment(x)
    } else if (methods::is(xss, "RNAStringSet")) {
        Biostrings::RNAMultipleAlignment(x)
    } else if (methods::is(xss, "AAStringSet")) {
        Biostrings::AAMultipleAlignment(x)
    } else {
        Biostrings::BStringSet(x)
    }
}
