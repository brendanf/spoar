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

checkWeights <- function(seq, w) {
    assertthat::assert_that(
        isPositiveInt(w),
        isConformable(w, seq)
    )
}

areSameLength <- function(x, y) {
    length(x) == length(y)
}
assertthat::on_failure(areSameLength) <- function(call, env) {
    sprintf(
        "Arguments '%s' and '%s' do not have the same length.",
        deparse(call$x), deparse(call$y)
    )
}

isAllPositive <- function(x) {
    all(vapply(x, function(y) all(vapply(y, `>`, TRUE, 0)), TRUE))
}
assertthat::on_failure(isAllPositive) <- function(call, env) {
    sprintf(
        "Argument '%s' is not a list of positive numeric vectors.",
        deparse(call$x)
    )
}

areSameWidth <- function(x, y) {
    all(nchar(x) == vapply(y, length, 1L))
}
assertthat::on_failure(areSameWidth) <- function(call, env) {
    sprintf(
        "Arguments '%s' and '%s' do not have matching widths.",
        deparse(call$x), deparse(call$y)
    )
}

checkQuals <- function(seq, qual) {
    assertthat::assert_that(
        isAllPositive(qual),
        areSameLength(seq, qual),
        areSameWidth(seq, qual)
    )
}

requireBiostrings <- function() {
    if (!requireNamespace("Biostrings", quietly = TRUE)) {
        stop("Operating on XStringSet objects requires the 'Biostrings' package.")
    }
}

requireShortRead <- function() {
    if (!requireNamespace("ShortRead", quietly = TRUE)) {
        stop("Operating on ShortRead objects requires the 'ShortRead' package.")
    }
}

## convert a character vector into an XString of type matching xss
matchXString <- function(x, xss) {
    requireBiostrings()
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
    requireBiostrings()
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
