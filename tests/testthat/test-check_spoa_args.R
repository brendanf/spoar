sequences <- c(
    "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
)

test_that("invalid arguments are rejected", {
    expect_error(spoaAlign(sequences, gap_extend = -6))
    expect_error(spoaAlign(sequences, gap_extend2 = -6))
    expect_error(spoaAlign(sequences, gap_open2 = -6))
    expect_error(spoaAlign(sequences,
        gap_extend = -6,
        gap_algorithm = "linear"
    ))
    expect_error(spoaAlign(sequences,
        gap_extend2 = -6,
        gap_algorithm = "linear"
    ))
    expect_error(spoaAlign(sequences,
        gap_open2 = -6,
        gap_algorithm = "linear"
    ))
    spoaAlign(sequences, gap_extend = -6, gap_algorithm = "affine")
    expect_error(spoaAlign(sequences,
        gap_open2 = -6,
        gap_algorithm = "affine"
    ))
    expect_error(spoaAlign(sequences,
        gap_extend2 = -6,
        gap_algorithm = "affine"
    ))
    expect_error(spoaAlign(sequences, algorithm = "wrong"))
    expect_error(spoaAlign(sequences, gap_algorithm = "wrong"))
    expect_error(doCheckSpoaArgs(sequences, gap_algorithm = "wrong"))
    expect_error(spoa_consensus_character(
        sequences, "wrong", "linear", 5, -2,
        -10, 0, -3, -1
    ))
    expect_error(spoa_align_character(
        sequences, "wrong", "linear", 5, -2,
        -10, 0, -3, -1
    ))
    expect_error(spoa_consensus_character(
        sequences, "global", "wrong", 5, -2,
        -10, 0, -3, -1
    ))
    expect_error(spoa_align_character(
        sequences, "global", "wrong", 5, -2,
        -10, 0, -3, -1
    ))
})
