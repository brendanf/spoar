sequences <- c(
    "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
)

test_that("invalid arguments are rejected", {
    expect_error(spoa_align(sequences, gap_extend = -6))
    expect_error(spoa_align(sequences, gap_extend2 = -6))
    expect_error(spoa_align(sequences, gap_open2 = -6))
    expect_error(spoa_align(sequences,
        gap_extend = -6,
        gap_algorithm = "linear"
    ))
    expect_error(spoa_align(sequences,
        gap_extend2 = -6,
        gap_algorithm = "linear"
    ))
    expect_error(spoa_align(sequences,
        gap_open2 = -6,
        gap_algorithm = "linear"
    ))
    spoa_align(sequences, gap_extend = -6, gap_algorithm = "affine")
    expect_error(spoa_align(sequences,
        gap_open2 = -6,
        gap_algorithm = "affine"
    ))
    expect_error(spoa_align(sequences,
        gap_extend2 = -6,
        gap_algorithm = "affine"
    ))
    expect_error(spoa_align(sequences, algorithm = "wrong"))
    expect_error(spoa_align(sequences, gap_algorithm = "wrong"))
})
