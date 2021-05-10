sequences <- c(
    A = "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    B = "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    C = "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    D = "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    E = "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    F = "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT",
    G = NA_character_
)

test_that("spoa_align handles NA", {
    msa <- spoa_align(sequences)
    expect_equal(names(sequences), names(msa))
    expect_equal(is.na(sequences), is.na(msa))
})

test_that("spoa_consensus handles NA", {
    expect_equal(
        spoa_consensus(sequences),
        spoa_consensus(sequences[!is.na(sequences)])
    )
})
