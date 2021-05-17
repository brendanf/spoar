sequences <- c(
    "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
)

int_qualities <- lapply(nchar(sequences), sample.int, n = 40, replace = TRUE)
qualities <- lapply(int_qualities, Biostrings::PhredQuality)
qualities <- do.call(c, qualities)

qsdnass <- Biostrings::QualityScaledDNAStringSet(sequences, qualities)
names(qsdnass) <- LETTERS[1:6]
sr <- Biostrings::DNAStringSet(sequences)
id <- Biostrings::BStringSet(LETTERS[1:6])
srq <- ShortRead::ShortReadQ(sr, qualities, id)
names(sequences) <- LETTERS[1:6]

test_that("quality score alignment works", {
    expect_error(spoaAlign(sequences, qual = int_qualities), NA)
    expect_error(spoaAlign(qsdnass), NA)
    expect_error(spoaAlign(srq), NA)
    expect_equal(
        as.character(spoaAlign(qsdnass)),
        spoaAlign(sequences, qual = int_qualities)
    )
    expect_equal(as.character(spoaAlign(qsdnass)), as.character(spoaAlign(srq)))
})

test_that("quality score consensus works", {
    expect_error(spoaConsensus(sequences, qual = int_qualities), NA)
    expect_error(spoaConsensus(qsdnass), NA)
    expect_error(spoaConsensus(srq), NA)
    expect_equal(
        as.character(spoaConsensus(qsdnass)),
        spoaConsensus(sequences, qual = int_qualities)
    )
    expect_equal(
        as.character(spoaConsensus(qsdnass)),
        as.character(spoaConsensus(srq))
    )
})

weights <- seq(21, 1, -4)
repsequences <- rep(sequences, weights)
rep_int_qualities <- rep(int_qualities, weights)
repqsdnass <- rep(qsdnass, weights)
test_that("weighted quality score alignment works", {
    expect_error(spoaAlign(sequences, qual = int_qualities, w = weights), NA)
    expect_error(spoaAlign(qsdnass, w = weights), NA)
    expect_error(spoaAlign(srq, w = weights), NA)
    expect_equal(
        as.character(spoaAlign(qsdnass, w = weights)),
        spoaAlign(sequences, qual = int_qualities, w = weights)
    )
    expect_equal(
        as.character(spoaAlign(qsdnass, w = weights)),
        as.character(spoaAlign(srq, w = weights))
    )
    expect_equal(
        spoaAlign(repsequences, qual = rep_int_qualities),
        rep(spoaAlign(sequences, qual = int_qualities, w = weights), weights)
    )
    expect_equal(
        spoaAlign(repsequences, qual = rep_int_qualities),
        as.character(spoaAlign(repqsdnass))
    )
})

test_that("weighted quality score consensus works", {
    expect_error(spoaConsensus(sequences, qual = int_qualities, w = weights), NA)
    expect_error(spoaConsensus(qsdnass, w = weights), NA)
    expect_error(spoaConsensus(srq, w = weights), NA)
    expect_equal(
        as.character(spoaConsensus(qsdnass, w = weights)),
        spoaConsensus(sequences, qual = int_qualities, w = weights)
    )
    expect_equal(
        as.character(spoaConsensus(qsdnass, w = weights)),
        as.character(spoaConsensus(srq, w = weights))
    )
    expect_equal(
        spoaConsensus(repsequences, qual = rep_int_qualities),
        spoaConsensus(sequences, qual = int_qualities, w = weights)
    )
    expect_equal(
        spoaConsensus(repsequences, qual = rep_int_qualities),
        as.character(spoaConsensus(repqsdnass))
    )
})
