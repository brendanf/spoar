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
        spoaAlgo(algorithm = "wrong"),
        "'arg' should be one of \"local\", \"global\", \"semi.global\""
    )
    expect_error(spoaAlgo(m = -1L),
        "m is not a single non-negative integer.",
        fixed = TRUE
    )
    expect_error(
        spoaAlgo(n = 1L),
        "n is not a single non-positive integer."
    )
    expect_error(
        spoaAlgo(g = 1L),
        "g is not a single non-positive integer."
    )
    expect_error(
        spoaAlgo(e = 1L),
        "e is not a single non-positive integer."
    )
    expect_error(
        spoaAlgo(q = 1L),
        "q is not a single non-positive integer."
    )
    expect_error(
        spoaAlgo(c = 1L),
        "c is not a single non-positive integer."
    )
    expect_error(
        spoaAlgo("wrong", 5L, -2L, -8L, 0L, -3L, -1L),
        "'arg' should be one of \"local\", \"global\", \"semi.global\""
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
