# Brendan Furneaux
# May 2021

check_spoa_args <- function(algorithm, gap_algorithm) {
    # get the call for the parent function
    mycall <- sys.call(-2)
    print(mycall)
    mycall[1] <- call("do_check_spoa_args")
    mycall$algorithm <- algorithm
    mycall$gap_algorithm <- gap_algorithm
    mycall$call <- sys.call(-2)
    eval(mycall)
}

do_check_spoa_args <- function(match = 5, mismatch = -4, gap_open = -8,
    gap_extend = -6, gap_open2 = -10, gap_extend2 = -4,
    gap_algorithm, call, ...) {
    switch(gap_algorithm,
        linear = {
            extra_args <- c(
                if (!missing(gap_extend)) "gap_extend",
                if (!missing(gap_open2)) "gap_open2",
                if (!missing(gap_extend2)) "gap_open2"
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
                if (!missing(gap_extend2)) "gap_open2"
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
}

#' Align sequences using SPOA (and optionally get the consensus)
#'
#' @param seq sequences to align
#' @param match (non-negative `integer`) score for a match ("`m`" in SPOA).
#' *Default*: `5L`
#' @param mismatch (non-positive `integer`) score for a mismatch ("`n`" in SPOA)
#' *Default*: `-4L`
#' @param gap_open (non-positive `integer`) gap opening penalty ("`g`" in SPOA).
#' *Default*: `-8L`
#' @param gap_extend (non-positive `integer`) gap extension penalty ("`e`" in
#' SPOA); valid only for `gap_algorithm = "affine"` or `"convex"`.
#' *Default*: `-6L`
#' @param gap_open2 (non-positive `integer`) second gap opening penalty ("`q`"
#' in SPOA); valid only for `gap_algorithm = "convex"`. *Default*: `-10L`
#' @param gap_extend2 (non-positive `integer`) second gap extension penalty
#' ("`c`" in SPOA); valid only for `gap_algorithm = "convex"`. *Default*: `-4L`
#' @param algorithm (`character` string) alignment mode; one of `"local"`
#' (Smith-Watterman), `"global"` (Needleman-Wunsch), or `"semi.global"`
#' (Overlap). *Default*: `"local"`
#' @param gap_algorithm (`character` string) gap scoring algorithm; one of
#' `"linear"`, `"affine"`, or `"convex"`. *Default*: `"linear"`
#' @param both_strands (`logical`) if `TRUE`, try to reverse complement
#' sequences during alignment. *Default*: `FALSE`
#' @param ... additional parameters passed to methods
#'
#' @return an object of the same type as `seq`, giving the aligned sequences.
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
#' "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
#' "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
#' "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
#' "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
#' "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
#' "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
#' )
#' spoa_align(sequences)
#' spoa_consensus(sequences)
#'
#' @export
spoa_align <- function(seq, match = 5, mismatch = -4, gap_open = -8, gap_extend = -6,
    gap_open2 = -10, gap_extend2 = -4,
    algorithm = c("local", "global", "semi.global"),
    gap_algorithm = c("linear", "affine", "convex"),
    both_strands = FALSE, ...) {
    UseMethod("spoa_align")
}

#' @rdname spoa_align
#' @export
spoa_align.character <- function(seq, match = 5, mismatch = -4, gap_open = -8, gap_extend = -6,
    gap_open2 = -10, gap_extend2 = -4,
    algorithm = c("local", "global", "semi.global"),
    gap_algorithm = c("linear", "affine", "convex"),
    both_strands = FALSE, ...) {
    algorithm <- match.arg(algorithm)
    gap_algorithm <- match.arg(gap_algorithm)
    check_spoa_args(algorithm, gap_algorithm)
    spoa_align_character(seq)
}

#' @rdname spoa_align
#' @export
spoa_consensus <- function(seq, match = 5, mismatch = -4, gap_open = -8,
    gap_extend = -6, gap_open2 = -10, gap_extend2 = -4,
    algorithm = c("local", "global", "semi.global"),
    gap_algorithm = c("linear", "affine", "convex"),
    both_strands = FALSE, ...) {
    UseMethod("spoa_consensus")
}

#' @rdname spoa_align
#' @export
spoa_consensus.character <- function(seq, match = 5, mismatch = -4, gap_open = -8,
    gap_extend = -6, gap_open2 = -10, gap_extend2 = -4,
    algorithm = c("local", "global", "semi.global"),
    gap_algorithm = c("linear", "affine", "convex"),
    both_strands = FALSE, ...) {
    algorithm <- match.arg(algorithm)
    gap_algorithm <- match.arg(gap_algorithm)
    check_spoa_args(algorithm, gap_algorithm)
    spoa_consensus_character(seq)
}

#' @rdname spoa_align
#' @export
spoa_consensus.XStringSet <- function(seq, match = 5, mismatch = -4, gap_open = -8,
    gap_extend = -6, gap_open2 = -10, gap_extend2 = -4,
    algorithm = c("local", "global", "semi.global"),
    gap_algorithm = c("linear", "affine", "convex"),
    both_strands = FALSE, ...) {
    algorithm <- match.arg(algorithm)
    gap_algorithm <- match.arg(gap_algorithm)
    check_spoa_args(algorithm, gap_algorithm)
    s <- spoa_consensus_character(as.character(seq))
    if (methods::is(seq, "DNAStringSet")) {
        Biostrings::DNAStringSet(s)
    } else if (methods::is(seq, "RNAStringSet")) {
        Biostrings::RNAStringSet(s)
    } else if (methods::is(seq, "AAStringSet")) {
        Biostrings::AAStringSet(s)
    } else {
        Biostrings::BStringSet(s)
    }
}
