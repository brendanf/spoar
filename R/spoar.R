## Brendan Furneaux
## May 2021

## check that the arguments of the calling spoa_XXX function are appropriate
## for the given algorithm and gap_algorithm
checkSpoaArgs <- function(algorithm, gap_algorithm) {
    # get the call for the parent function
    # -2 is to skip "UseMethod"
    mycall <- match.call(sys.function(-2), sys.call(-2))
    mycall[1] <- call("doCheckSpoaArgs")
    mycall$algorithm <- algorithm
    mycall$gap_algorithm <- gap_algorithm
    mycall$call <- sys.call(-2)
    eval(mycall)
}

doCheckSpoaArgs <- function(match = 5L,
    mismatch = -4L,
    gap_open = -8L,
    gap_extend = -6L,
    gap_open2 = -10L,
    gap_extend2 = -4L,
    gap_algorithm,
    call,
    ...) {
    switch(gap_algorithm,
        linear = {
            extra_args <- c(
                if (!missing(gap_extend)) "gap_extend",
                if (!missing(gap_open2)) "gap_open2",
                if (!missing(gap_extend2)) "gap_extend2"
            )
            if (length(extra_args)) {
                stop("Error in ", call, ":\nArguments ",
                    paste(shQuote(extra_args), collapse = ", "),
                    "are invalid for gap algorithm 'linear'.",
                    call. = FALSE
                )
            }
        },
        affine = {
            extra_args <- c(
                if (!missing(gap_open2)) "gap_open2",
                if (!missing(gap_extend2)) "gap_extend2"
            )
            if (length(extra_args)) {
                stop("Error in ", call, ":\nArguments ",
                    paste(shQuote(extra_args), collapse = ", "),
                    "are invalid for gap algorithm 'affine'.",
                    call. = FALSE
                )
            }
        },
        convex = NULL,
        stop("Error in ", call, ":\nInvalid gap algorithm '", gap_algorithm,
            "'.",
            call. = FALSE
        )
    )
    assertthat::assert_that(
        isNonnegativeInt(match),
        isNonpositiveInt(mismatch),
        isNonpositiveInt(gap_open),
        isNonpositiveInt(gap_extend),
        isNonpositiveInt(gap_open2),
        isNonpositiveInt(gap_extend2)
    )
}

#' Align sequences using SPOA (and optionally get the consensus)
#'
#' @param seq (`character` vector or [`Biostrings::XStringSet-class`]) sequences
#' to align
#' @param match (non-negative `integer`) score for a match ("`m`" in SPOA).
#' *Default*: `5L`
#' @param mismatch (non-positive `integer`) score for a mismatch ("`n`" in SPOA)
#' *Default*: `-4L`
#' @param gap_open (non-positive `integer`) gap opening penalty ("`g`" in SPOA).
#' *Default*: `-8L`
#' @param gap_extend (non-positive `integer`) gap extension penalty ("`e`" in
#' SPOA); valid only for `gap_algorithm="affine"` or `"convex"`.
#' *Default*: `-6L`
#' @param gap_open2 (non-positive `integer`) second gap opening penalty ("`q`"
#' in SPOA); valid only for `gap_algorithm="convex"`. *Default*: `-10L`
#' @param gap_extend2 (non-positive `integer`) second gap extension penalty
#' ("`c`" in SPOA); valid only for `gap_algorithm="convex"`. *Default*: `-4L`
#' @param algorithm (`character` string) alignment mode; one of `"local"`
#' (Smith-Watterman), `"global"` (Needleman-Wunsch), or `"semi.global"`
#' (Overlap). *Default*: `"local"`
#' @param gap_algorithm (`character` string) gap scoring algorithm; one of
#' `"linear"`, `"affine"`, or `"convex"`. *Default*: `"linear"`
#' @param ... additional parameters passed to methods
#'
#' @return For `spoaConsensus()`, either a `character` string or the
#' appropriate [`Biostrings::XString-class`], depending on the class of `seq`.
#'
#' For `spoaAlign()`, either a
#' `character` vector or a [`Biostrings::MultipleAlignment-class`], depending on
#' the class of `seq`. If `seq` is a `BStringSet` (i.e., an `XStringSet` which
#' is not specifically DNA, RNA, or AA) then the result is also a `BStringSet`,
#' since there is no corresponding "`BMultipleAlignment`" class.
#'
#' @details The gap penalty formulas are:
#'
#' `linear`: `g * i`
#'
#' `affine`: `g + (i - 1) * e`
#'
#' `convex`: `min(g + (i - i) * e, q + (i - 1) \cdot c)`
#'
#' @examples
#' sequences <- c(
#'     "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
#'     "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
#'     "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
#'     "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
#'     "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
#'     "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
#' )
#' spoaAlign(sequences)
#' spoaConsensus(sequences)
#' @export
spoaAlign <- function(seq, match = 5L,
    mismatch = -4L,
    gap_open = -8L,
    gap_extend = -6L,
    gap_open2 = -10L,
    gap_extend2 = -4L,
    algorithm = c("local", "global", "semi.global"),
    gap_algorithm = c("linear", "affine", "convex"),
    ...) {
    UseMethod("spoaAlign")
}


#' @export
spoaAlign.character <- function(seq,
    match = 5L,
    mismatch = -4L,
    gap_open = -8L,
    gap_extend = -6L,
    gap_open2 = -10L,
    gap_extend2 = -4L,
    algorithm = c("local", "global", "semi.global"),
    gap_algorithm = c("linear", "affine", "convex"),
    ...) {
    algorithm <- match.arg(algorithm)
    gap_algorithm <- match.arg(gap_algorithm)
    checkSpoaArgs(algorithm, gap_algorithm)

    msa <- rep(NA_character_, length(seq))
    names(msa) <- names(seq)
    msa[!is.na(seq)] <- spoa_align_character(
        seq[!is.na(seq)], algorithm, gap_algorithm, match, mismatch,
        gap_open, gap_extend, gap_open2, gap_extend2
    )
    msa
}

#' @export
spoaAlign.XStringSet <- function(seq,
    match = 5L,
    mismatch = -4L,
    gap_open = -8L,
    gap_extend = -6L,
    gap_open2 = -10L,
    gap_extend2 = -4L,
    algorithm = c("local", "global", "semi.global"),
    gap_algorithm = c("linear", "affine", "convex"),
    ...) {
    algorithm <- match.arg(algorithm)
    gap_algorithm <- match.arg(gap_algorithm)
    checkSpoaArgs(algorithm, gap_algorithm)
    s <- spoa_align_character(
        as.character(seq), algorithm, gap_algorithm,
        match, mismatch, gap_open, gap_extend, gap_open2, gap_extend2
    )
    names(s) <- names(seq)
    matchXMultipleAlignment(s, seq)
}

#' @rdname spoaAlign
#' @export
spoaConsensus <- function(seq,
    match = 5L,
    mismatch = -4L,
    gap_open = -8L,
    gap_extend = -6L,
    gap_open2 = -10L,
    gap_extend2 = -4L,
    algorithm = c("local", "global", "semi.global"),
    gap_algorithm = c("linear", "affine", "convex"),
    ...) {
    UseMethod("spoaConsensus")
}

#' @export
spoaConsensus.character <- function(seq,
    match = 5L,
    mismatch = -4L,
    gap_open = -8L,
    gap_extend = -6L,
    gap_open2 = -10L,
    gap_extend2 = -4L,
    algorithm = c("local", "global", "semi.global"),
    gap_algorithm = c("linear", "affine", "convex"),
    ...) {
    algorithm <- match.arg(algorithm)
    gap_algorithm <- match.arg(gap_algorithm)
    checkSpoaArgs(algorithm, gap_algorithm)
    spoa_consensus_character(
        seq[!is.na(seq)], algorithm, gap_algorithm, match, mismatch,
        gap_open, gap_extend, gap_open2, gap_extend2
    )
}

#' @export
spoaConsensus.XStringSet <- function(seq,
    match = 5L,
    mismatch = -4L,
    gap_open = -8L,
    gap_extend = -6L,
    gap_open2 = -10L,
    gap_extend2 = -4L,
    algorithm = c("local", "global", "semi.global"),
    gap_algorithm = c("linear", "affine", "convex"),
    ...) {
    algorithm <- match.arg(algorithm)
    gap_algorithm <- match.arg(gap_algorithm)
    checkSpoaArgs(algorithm, gap_algorithm)
    s <- spoa_consensus_character(
        as.character(seq), algorithm, gap_algorithm,
        match, mismatch, gap_open, gap_extend, gap_open2, gap_extend2
    )
    matchXString(s, seq)
}
