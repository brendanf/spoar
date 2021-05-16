sequences <- c(
    "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
)

qualities <- lapply(nchar(sequences), sample.int, n = 40, replace = TRUE)
qualities <- lapply(qualities, Biostrings::PhredQuality)
qualities <- do.call(c, qualities)

qsdnass <- Biostrings::QualityScaledDNAStringSet(sequences, qualities)
names(qsdnass) <- LETTERS[1:6]
sr <- Biostrings::DNAStringSet(sequences)
id <- Biostrings::BStringSet(LETTERS[1:6])
srq <- ShortRead::ShortReadQ(sr, qualities, id)

test_that("quality score alignment works", {
    expect_error(spoaAlign(qsdnass), NA)
    expect_error(spoaAlign(srq), NA)
    expect_equal(as.character(spoaAlign(qsdnass)), as.character(spoaAlign(srq)))
})

test_that("quality score consensus works", {
    expect_error(spoaConsensus(qsdnass), NA)
    expect_error(spoaConsensus(srq), NA)
    expect_equal(
        as.character(spoaConsensus(qsdnass)),
        as.character(spoaConsensus(srq))
    )
})
