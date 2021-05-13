## Brendan Furneaux
## May 2021

## assertthat tests for nonpositive and nonnegative scalar integer(ish)s
isNonpositiveScalarInt <- function(x) {
    !is.null(x) && length(x) == 1L && is.numeric(x) && x == round(x) && x <= 0
}
assertthat::on_failure(isNonpositiveScalarInt) <- function(call, env) {
    paste(deparse(call$x), "is not a single non-positive integer.")
}

isNonnegativeScalarInt <- function(x) {
    !is.null(x) && length(x) == 1L && is.numeric(x) && x == round(x) && x >= 0
}
assertthat::on_failure(isNonnegativeScalarInt) <- function(call, env) {
    paste(deparse(call$x), "is not a single non-negative integer.")
}

## assertthat tests for valid weights vector
isPositiveInt <- function(x) {
    is.numeric(x) && !any(is.na(x)) && all(x > 0) && all(x == round(x))
}
assertthat::on_failure(isPositiveInt) <- function(call, env) {
    paste(deparse(call$x), "is not a positive integer scalar or vector.")
}
isConformable <- function(x, y) {
    length(x) == 1 || length(x) == length(y)
}
assertthat::on_failure(isConformable) <- function(call, env) {
    sprintf(
        "Vector %s with length %i is not conformable to vector %s with length %i.",
        deparse(call$x), length(eval(call$x, env)),
        deparse(call$y), length(eval(call$y, env))
    )
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
