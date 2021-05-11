sequences <- c(
    A = "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    B = "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    C = "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    D = "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    E = "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    F = "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT",
    G = NA_character_
)

test_that("spoaAlign handles NA", {
    msa <- spoaAlign(sequences)
    expect_equal(names(sequences), names(msa))
    expect_equal(is.na(sequences), is.na(msa))
})

test_that("spoaConsensus handles NA", {
    expect_equal(
        spoaConsensus(sequences),
        spoaConsensus(sequences[!is.na(sequences)])
    )
})
