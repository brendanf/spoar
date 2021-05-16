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
#' @param seq (`character` vector, [`Biostrings::XStringSet-class`],
#' [`ShortRead::ShortRead-class`], or [`dada2::derep-class`]) sequences to
#' align.
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
#' since there is no corresponding "`BMultipleAlignment`" class. If `seq` is a
#' [`ShortRead::ShortRead-class`] object, the output is a
#' [`Biostrings::DNAMultipleAlignment-class`].
#'
#' | **seq**| **spoaConsensus** | **spoaAlign** |
#' |---------|---------------|-----------|
#' |`character(n)`|`character(1)` | `character(n)`|
#' |[`BStringSet`][Biostrings::XStringSet-class]|[`BString`][Biostrings::XString-class]|[`BStringSet`][Biostrings::XStringSet-class]|
#' |[`DNAStringSet`][Biostrings::XStringSet-class]|[`DNAString`][Biostrings::XString-class]|[`DNAMultipleAlignment`][Biostrings::MultipleAlignment-class]|
#' |[`RNAStringSet`][Biostrings::XStringSet-class]|[`RNAString`][Biostrings::XString-class]|[`RNAMultipleAlignment`][Biostrings::MultipleAlignment-class]|
#' |[`AAStringSet`][Biostrings::XStringSet-class]|[`AAString`][Biostrings::XString-class]|[`AAMultipleAlignment`][Biostrings::MultipleAlignment-class]|
#' |[`QualityScaledBStringSet`][Biostrings::QualityScaledXStringSet-class]|[`BString`][Biostrings::XString-class]|[`BStringSet`][Biostrings::XStringSet-class]|
#' |[`QualityScaledDNAStringSet`][Biostrings::QualityScaledXStringSet-class]|[`DNAString`][Biostrings::XString-class]|[`DNAMultipleAlignment`][Biostrings::MultipleAlignment-class]|
#' |[`QualityScaledRNAStringSet`][Biostrings::QualityScaledXStringSet-class]|[`RNAString`][Biostrings::XString-class]|[`RNAMultipleAlignment`][Biostrings::MultipleAlignment-class]|
#' |[`QualityScaledAAStringSet`][Biostrings::QualityScaledXStringSet-class]|[`AAString`][Biostrings::XString-class]|[`AAMultipleAlignment`][Biostrings::MultipleAlignment-class]|
#' |[`ShortReadQ`][ShortRead::ShortReadQ-class]|[`DNAString`][Biostrings::XString-class]|[`DNAMultipleAlignment`][Biostrings::MultipleAlignment-class]|
#' |[`derep`][dada2::derep-class]|`character(1)`| `character(n)`|
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
#' Note that POA is not order-independent, so results may differ when a set of
#' non-unique sequences is dereplicated. For the most predictable results, it
#' is recommended to sort dereplicated sequences in decreasing order of
#' abundance (as in [dada2::derepFastq()]).
#'
#' ## Quality scores
#'
#' If `seq` is an object which includes quality scores
#' ([`Biostrings::QualityScaledXStringSet-class`] or [`ShortRead::ShortReadQ`]),
#' then the alignment consensus is weighted using the quality scores. The method
#' used by SPOA uses the integer quality scores as per-position weights
#' analogous to sequence weights; i.e., if two different bases align in the same
#' position, one in a single sequence with quality score 40 and the other in a
#' single sequence with quality score 20, then this is equivalent to the first
#' base occurring at that position in 40 sequences without quality scores, and
#' the second base occurring at that position in 20 sequences without quality
#' scores.
#'
#' It is possible to use a combination of sequence weights and quality scores.
#' In this case, in order for a dereplicated sequence set to give the same
#' results as the non-dereplicated sequences, the quality score for each of the
#' dereplicated sequences should be the mean of the quality scores for the
#' corresponding non-dereplicated sequences. This is the method used to generate
#' quality scores for dereplicated sequences in [dada2::derepFastq()].
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
    m = 5L, n = -4L, g = -8L, e = g, q = g, c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1,
    ...) {
    UseMethod("spoaAlign")
}


#' @export
spoaAlign.character <- function(seq,
    m = 5L, n = -4L, g = -8L, e = g, q = g, c = e,
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
    m = 5L, n = -4L, g = -8L, e = g, q = g, c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1,
    ...) {
    s <- spoaAlign.character(as.character(seq), m, n, g, e, q, c, algorithm, w)
    matchXMultipleAlignment(s, seq)
}

#' @export
spoaAlign.ShortRead <- function(seq,
    m = 5L, n = -4L, g = -8L, e = g, q = g, c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1L,
    ...) {
    requireShortRead()
    seq2 <- ShortRead::sread(seq)
    names(seq2) <- as.character(ShortRead::id(seq))
    spoaAlign.XStringSet(seq2, m, n, g, e, q, c, algorithm, w)
}

#' @export
spoaAlign.QualityScaledXStringSet <- function(seq,
    m = 5L, n = -4L, g = -8L, e = g, q = g, c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1L,
    ...) {
    algorithm <- match.arg(algorithm)
    checkSpoaArgs(seq, m, n, g, e, q, c, w)
    requireBiostrings()
    if (length(w) == 1L) w <- rep(w, length(seq))
    s <- spoa_align_intqual(
        as.character(seq),
        as.list(as(Biostrings::quality(seq), "IntegerList")),
        algorithm, m, n, g, e, q, c, w
    )
    matchXMultipleAlignment(s, seq)
}

#' @export
spoaAlign.ShortReadQ <- function(seq,
    m = 5L, n = -4L, g = -8L, e = g, q = g, c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1L,
    ...) {
    requireShortRead()
    requireBiostrings()
    spoaAlign.QualityScaledXStringSet(
        methods::as(seq, "QualityScaledDNAStringSet"),
        m, n, g, e, q, c, algorithm, w, ...
    )
}

#' @export
spoaAlign.derep <- function(seq,
    m = 5L, n = -4L, g = -8L, e = g, q = g, c = e,
    algorithm = c("local", "global", "semi.global"),
    ...) {
    algorithm <- match.arg(algorithm)
    checkSpoaArgs(names(seq$uniques), m, n, g, e, q, c, seq$uniques)
    spoa_align_dblqual(
        names(seq$uniques),
        apply(seq$quals, 1, stats::na.omit), algorithm, m, n, g, e, q, c,
        seq$uniques
    )
}

#' @rdname spoaAlign
#' @export
spoaConsensus <- function(seq,
    m = 5L, n = -4L, g = -8L, e = g, q = g, c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1L,
    ...) {
    UseMethod("spoaConsensus")
}

#' @export
spoaConsensus.character <- function(seq,
    m = 5L, n = -4L, g = -8L, e = g, q = g, c = e,
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
    m = 5L, n = -4L, g = -8L, e = g, q = g, c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1L,
    ...) {
    s <- spoaConsensus.character(
        as.character(seq), m, n, g, e, q, c, algorithm,
        w
    )
    matchXString(s, seq)
}

#' @export
spoaConsensus.ShortRead <- function(seq,
    m = 5L, n = -4L, g = -8L, e = g, q = g, c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1L,
    ...) {
    requireShortRead()
    seq2 <- ShortRead::sread(seq)
    names(seq2) <- as.character(ShortRead::id(seq))
    spoaConsensus.XStringSet(seq2, m, n, g, e, q, c, algorithm, w)
}

#' @export
spoaConsensus.QualityScaledXStringSet <- function(seq,
    m = 5L, n = -4L, g = -8L, e = g, q = g, c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1L,
    ...) {
    algorithm <- match.arg(algorithm)
    checkSpoaArgs(seq, m, n, g, e, q, c, w)
    requireBiostrings()
    if (length(w) == 1L) w <- rep(w, length(seq))
    s <- spoa_consensus_intqual(
        as.character(seq),
        as.list(methods::as(Biostrings::quality(seq), "IntegerList")),
        algorithm, m, n, g, e, q, c, w
    )
    matchXString(s, seq)
}

#' @export
spoaConsensus.ShortReadQ <- function(seq,
    m = 5L, n = -4L, g = -8L, e = g, q = g, c = e,
    algorithm = c("local", "global", "semi.global"),
    w = 1L,
    ...) {
    requireShortRead()
    requireBiostrings()
    spoaConsensus.QualityScaledXStringSet(
        methods::as(seq, "QualityScaledDNAStringSet"),
        m, n, g, e, q, c, algorithm, w, ...
    )
}

#' @export
spoaConsensus.derep <- function(seq,
    m = 5L, n = -4L, g = -8L, e = g, q = g, c = e,
    algorithm = c("local", "global", "semi.global"),
    ...) {
    algorithm <- match.arg(algorithm)
    checkSpoaArgs(names(seq$uniques), m, n, g, e, q, c, seq$uniques)
    spoa_consensus_dblqual(
        names(seq$uniques),
        apply(seq$quals, 1, stats::na.omit), algorithm, m, n, g, e, q, c,
        seq$uniques
    )
}
