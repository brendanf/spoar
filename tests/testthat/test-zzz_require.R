unloadNamespace("dada2")
unloadNamespace("ShortRead")
unloadNamespace("GenomicAlignments")
unloadNamespace("Rsamtools")
unloadNamespace("Biostrings")
templib <- tempfile()
dir.create(templib, showWarnings = FALSE)
sequences <- c(
    "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
)
# create fake S3 objects to test the package requirement code
xss <- structure(
    sequences,
    class = c("DNAStringSet", "XStringSet")
)
sr <- structure(
    sequences,
    class = "ShortRead"
)
qsxss <- structure(
    sequences,
    class = c(
        "QualityScaledDNAStringSet", "QualityScaledXStringSet",
        "DNAStringSet", "XStringSet"
    )
)
srq <- structure(
    sequences,
    class = c("ShortReadQ", "ShortRead")
)
test_that("requireXX() works", {
    withr::with_libpaths(
        templib,
        {
            expect_error(
                spoaConsensus(xss),
                "Operating on XStringSet objects requires the 'Biostrings' package."
            )
            expect_error(
                spoaConsensus(qsxss),
                "Operating on XStringSet objects requires the 'Biostrings' package."
            )
            expect_error(
                spoaConsensus(sr),
                "Operating on ShortRead objects requires the 'ShortRead' package."
            )
            expect_error(
                spoaConsensus(srq),
                "Operating on ShortRead objects requires the 'ShortRead' package."
            )
        }
    )
})
unlink(templib)
