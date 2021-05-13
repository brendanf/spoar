sequences <- c(
    "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
)

stringset <- Biostrings::DNAStringSet(sequences)
names(sequences) <- LETTERS[1:6]
id <- Biostrings::BStringSet(names(sequences))
sr <- ShortRead::ShortRead(sread = stringset, id = id)
stringset <- Biostrings::DNAStringSet(sequences)

test_that("DNAStringSet and ShortRead give the same results", {
    sr_align <- spoaAlign(sr)
    expect_s4_class(sr_align, "DNAMultipleAlignment")
    expect_equal(
        as.character(sr_align), as.character(spoaAlign(stringset))
    )
    sr_consensus <- spoaConsensus(sr)
    expect_s4_class(sr_consensus, "DNAString")
    expect_equal(
        as.character(sr_consensus), as.character(spoaConsensus(stringset))
    )
})
