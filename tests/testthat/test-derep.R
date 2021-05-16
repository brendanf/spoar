sequences <- c(
    "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
)
weights <- seq(21, 1, -4)
repsequences <- rep(sequences, weights)
names(repsequences) <- paste0("seq", seq_along(repsequences))
qualities <- lapply(unname(nchar(repsequences)), sample.int, n = 40, replace = TRUE)
qualities <- lapply(qualities, Biostrings::PhredQuality)
qualities <- do.call(c, qualities)
qsdnass <- Biostrings::QualityScaledDNAStringSet(repsequences, qualities)

testfastq <- tempfile(fileext = ".fastq")
Biostrings::writeQualityScaledXStringSet(qsdnass, testfastq)
derep <- dada2::derepFastq(testfastq)

test_that("consensus of derep works", {
    expect_error(spoaConsensus(derep), NA)
})
test_that("consensus of derep matches (abundance sorted) QSDNAStringSet", {
    expect_equal(spoaConsensus(derep), as.character(spoaConsensus(qsdnass)))
})

test_that("alignment of derep works", {
    expect_error(spoaAlign(derep), NA)
})
test_that("alignment of derep matches (abundance sorted) QSDNAStringSet", {
    expect_equal(spoaAlign(derep), unique(as.character(spoaAlign(qsdnass))))
})
