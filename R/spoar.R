## Brendan Furneaux
## May 2021

## validate the arguments of the calling spoaXXX function
checkSpoaArgs <- function(seq, m, n, g, e, q, c, w) {
    # get the call for the parent function
    # -2 is to skip "UseMethod"
    #  <- match.call(sys.function(-2), sys.call(-2))
    # args <- as.list(mycall)[-1]
    assertthat::assert_that(
        isNonnegativeScalarInt(m),
        isNonpositiveScalarInt(n),
        isNonpositiveScalarInt(g),
        isNonpositiveScalarInt(e),
        isNonpositiveScalarInt(q),
        isNonpositiveScalarInt(c),
        isPositiveInt(w),
        isConformable(w, seq)
    )
}

#' Align sequences using SPOA (and optionally get the consensus)
#'
#' @param seq (`character` vector or [`Biostrings::XStringSet-class`]) sequences
#' to align
#' @param m (non-negative `integer`) score for a match. *Default*: `5L`
#' @param n (non-positive `integer`) score for a mismatch. *Default*: `-4L`
#' @param g (non-positive `integer`) gap opening penalty. *Default*: `-8L`
#' @param e (non-positive `integer`) gap extension penalty. *Default*: same
#' value as `g`
#' @param q (non-positive `integer`) second gap opening penalty.
#' *Default*: same value as `g`
#' @param c (non-positive `integer`) second gap extension penalty.
#' *Default*: same value as `e`
#' @param algorithm (`character` string) alignment mode; one of `"local"`
#' (Smith-Watterman), `"global"` (Needleman-Wunsch), or `"semi.global"`
#' (Overlap). *Default*: `"local"`
#' @param w (`integer` vector) weights for the sequences. *Default*: `1L`
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
#' @details
#'
#' ## Gap penalties
#'
#' The general (convex) gap penalty formula is:
#'
#' `min(g + (i - i) * e, q + (i - 1) * c)`
#'
#' For `q == g` and `c == e` (as is the case unless `q` or `c` is explicitly
#' set), this simplifies to the affine gap penalty:
#'
#' `g + (i - 1) * e`
#'
#' If, additionally, `e == g` (the default), then this is the linear gap
#' penalty:
#'
#' `g * i`
#'
#' ## Weighting
#'
#' Assigning a weight *w* to a sequence is equivalent to including that sequence
#' *w* times; this is primarily useful for dereplicated sequences, where all
#' sequences are unique, and the weight represents their multiplicity.
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
spoaAlign <- function(seq,
    m = 5L,
    n = -4L,
    g = -8L,
    e = g,
    q = g,
    c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1,
    ...) {
    UseMethod("spoaAlign")
}


#' @export
spoaAlign.character <- function(seq,
    m = 5L,
    n = -4L,
    g = -8L,
    e = g,
    q = g,
    c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1,
    ...) {
    algorithm <- match.arg(algorithm)
    checkSpoaArgs(seq, m, n, g, e, q, c, w)
    if (length(w) == 1L) w <- rep(w, length(seq))
    s <- spoa_align(seq, algorithm, m, n, g, e, q, c, w)

    msa <- rep(NA_character_, length(seq))
    names(msa) <- names(seq)
    msa[!is.na(seq)] <- spoa_align(
        seq[!is.na(seq)], algorithm,
        m, n, g, e, q, c, w
    )
    msa
}

#' @export
spoaAlign.XStringSet <- function(seq,
    m = 5L,
    n = -4L,
    g = -8L,
    e = g,
    q = g,
    c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1,
    ...) {
    s <- spoaAlign.character(as.character(seq), m, n, g, e, q, c, algorithm, w)
    matchXMultipleAlignment(s, seq)
}

#' @export
spoaAlign.ShortRead <- function(seq,
    m = 5L,
    n = -4L,
    g = -8L,
    e = g,
    q = g,
    c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1L,
    ...) {
    requireShortRead()
    seq2 <- ShortRead::sread(seq)
    names(seq2) <- as.character(ShortRead::id(seq))
    spoaAlign.XStringSet(seq2, m, n, g, e, q, c, algorithm, w)
}

#' @rdname spoaAlign
#' @export
spoaConsensus <- function(seq,
    m = 5L,
    n = -4L,
    g = -8L,
    e = g,
    q = g,
    c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1L,
    ...) {
    UseMethod("spoaConsensus")
}

#' @export
spoaConsensus.character <- function(seq,
    m = 5L,
    n = -4L,
    g = -8L,
    e = g,
    q = g,
    c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1L,
    ...) {
    algorithm <- match.arg(algorithm)
    checkSpoaArgs(seq, m, n, g, e, q, c, w)
    if (length(w) == 1L) w <- rep(w, length(seq))
    spoa_consensus(seq[!is.na(seq)], algorithm, m, n, g, e, q, c, w)
}

#' @export
spoaConsensus.XStringSet <- function(seq,
    m = 5L,
    n = -4L,
    g = -8L,
    e = g,
    q = g,
    c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1L,
    ...) {
    s <- spoaConsensus.character(as.character(seq), m, n, g, e, q, c, algorithm,
        w)
    matchXString(s, seq)
}

#' @export
spoaConsensus.ShortRead <- function(seq,
    m = 5L,
    n = -4L,
    g = -8L,
    e = g,
    q = g,
    c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1L,
    ...) {
    requireShortRead()
    seq2 <- ShortRead::sread(seq)
    names(seq2) <- as.character(ShortRead::id(seq))
    spoaConsensus.XStringSet(seq2, m, n, g, e, q, c, algorithm, w)
}
