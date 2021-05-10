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
    expect_s4_class(spoa_align(stringset), "BStringSet")
    expect_equal(spoa_align(sequences), as.character(spoa_align(stringset)))
    expect_s4_class(spoa_consensus(stringset), "BString")
    expect_equal(
        spoa_consensus(sequences),
        as.character(spoa_consensus(stringset))
    )
})

stringset <- Biostrings::DNAStringSet(sequences)

test_that("character and DNAStringSet give same results", {
    expect_s4_class(spoa_align(stringset), "DNAMultipleAlignment")
    expect_equal(spoa_align(sequences), as.character(spoa_align(stringset)))
    expect_s4_class(spoa_consensus(stringset), "DNAString")
    expect_equal(
        spoa_consensus(sequences),
        as.character(spoa_consensus(stringset))
    )
})

stringset <- Biostrings::RNAStringSet(stringset)
sequences <- chartr("T", "U", sequences)
test_that("character and RNAStringSet give same results", {
    expect_s4_class(spoa_align(stringset), "RNAMultipleAlignment")
    expect_equal(spoa_align(sequences), as.character(spoa_align(stringset)))
    expect_s4_class(spoa_consensus(stringset), "RNAString")
    expect_equal(
        spoa_consensus(sequences),
        as.character(spoa_consensus(stringset))
    )
})

stringset <- Biostrings::RNAStringSet(sequences, start = 1, width = nchar(sequences) %/% 3 * 3)
stringset <- Biostrings::translate(stringset)
sequences <- as.character(stringset)
test_that("character and RNAStringSet give same results", {
    expect_s4_class(spoa_align(stringset), "AAMultipleAlignment")
    expect_equal(spoa_align(sequences), as.character(spoa_align(stringset)))
    expect_s4_class(spoa_consensus(stringset), "AAString")
    expect_equal(
        spoa_consensus(sequences),
        as.character(spoa_consensus(stringset))
    )
})
