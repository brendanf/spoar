sequences <- c(
    "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
)

test_that("invalid arguments are rejected", {
    expect_error(
        SpoaAlgo(algorithm = "wrong"),
        "'arg' should be one of \"local\", \"global\", \"semi.global\""
    )
    expect_error(SpoaAlgo(m = -1L),
        "m is not a single non-negative integer.",
        fixed = TRUE
    )
    expect_error(
        SpoaAlgo(n = 1L),
        "n is not a single non-positive integer."
    )
    expect_error(
        SpoaAlgo(g = 1L),
        "g is not a single non-positive integer."
    )
    expect_error(
        SpoaAlgo(e = 1L),
        "e is not a single non-positive integer."
    )
    expect_error(
        SpoaAlgo(q = 1L),
        "q is not a single non-positive integer."
    )
    expect_error(
        SpoaAlgo(c = 1L),
        "c is not a single non-positive integer."
    )
    expect_error(
        SpoaAlgo("wrong", 5L, -2L, -8L, 0L, -3L, -1L),
        "'arg' should be one of \"local\", \"global\", \"semi.global\""
    )
    expect_error(
        spoa_consensus(sequences, "wrong", 5L, -4L, -8L, -8L, -8L, -8L, rep(1L, 6))
    )
    expect_error(
        checkWeights(sequences, w = 1L:3L),
        "Vector w with length 3 is not conformable to vector seq with length 6."
    )
    expect_error(
        checkWeights(sequences, w = -1L:4L),
        "w is not a positive integer scalar or vector."
    )
    expect_error(
        checkWeights(sequences, w = 0L),
        "w is not a positive integer scalar or vector."
    )
})
