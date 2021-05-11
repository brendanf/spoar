sequences <- c(
    "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
)
names(sequences) <- LETTERS[1:6]

stringset <- Biostrings::BStringSet(sequences)

test_that("character and BStringSet give same results", {
    expect_s4_class(spoaAlign(stringset), "BStringSet")
    expect_equal(spoaAlign(sequences), as.character(spoaAlign(stringset)))
    expect_s4_class(spoaConsensus(stringset), "BString")
    expect_equal(
        spoaConsensus(sequences),
        as.character(spoaConsensus(stringset))
    )
})

stringset <- Biostrings::DNAStringSet(sequences)

test_that("character and DNAStringSet give same results", {
    expect_s4_class(spoaAlign(stringset), "DNAMultipleAlignment")
    expect_equal(spoaAlign(sequences), as.character(spoaAlign(stringset)))
    expect_s4_class(spoaConsensus(stringset), "DNAString")
    expect_equal(
        spoaConsensus(sequences),
        as.character(spoaConsensus(stringset))
    )
})

stringset <- Biostrings::RNAStringSet(stringset)
sequences <- chartr("T", "U", sequences)
test_that("character and RNAStringSet give same results", {
    expect_s4_class(spoaAlign(stringset), "RNAMultipleAlignment")
    expect_equal(spoaAlign(sequences), as.character(spoaAlign(stringset)))
    expect_s4_class(spoaConsensus(stringset), "RNAString")
    expect_equal(
        spoaConsensus(sequences),
        as.character(spoaConsensus(stringset))
    )
})

stringset <- Biostrings::RNAStringSet(sequences,
    start = 1,
    width = nchar(sequences) %/% 3 * 3
)
stringset <- Biostrings::translate(stringset)
sequences <- as.character(stringset)
test_that("character and RNAStringSet give same results", {
    expect_s4_class(spoaAlign(stringset), "AAMultipleAlignment")
    expect_equal(spoaAlign(sequences), as.character(spoaAlign(stringset)))
    expect_s4_class(spoaConsensus(stringset), "AAString")
    expect_equal(
        spoaConsensus(sequences),
        as.character(spoaConsensus(stringset))
    )
})
