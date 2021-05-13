sequences <- c(
    "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
)

test_that("invalid arguments are rejected", {
    expect_error(spoaAlign(sequences, algorithm = "wrong"),
        "'arg' should be one of \"local\", \"global\", \"semi.global\"")
    expect_error(spoaAlign(sequences, m = -1L),
        "m is not a single non-negative integer.", fixed = TRUE)
    expect_error(spoaAlign(sequences, n = 1L),
        "n is not a single non-positive integer.")
    expect_error(spoaAlign(sequences, g = 1L),
        "g is not a single non-positive integer.")
    expect_error(spoaAlign(sequences, e = 1L),
        "e is not a single non-positive integer.")
    expect_error(spoaAlign(sequences, q = 1L),
        "q is not a single non-positive integer.")
    expect_error(spoaAlign(sequences, c = 1L),
        "c is not a single non-positive integer.")
    expect_error(spoa_align(sequences, "wrong", 5L, -2L, -8L, 0L, -3L, -1L, 1L),
        "invalid alignment algorithm 'wrong'")
    expect_error(spoaAlign(sequences, w = 1L:3L),
        "Vector w with length 3 is not conformable to vector seq with length 6.")
    expect_error(spoaAlign(sequences, w = -1L:4L),
        "w is not a positive integer scalar or vector.")
    expect_error(spoaAlign(sequences, w = 0L),
                 "w is not a positive integer scalar or vector.")
})
