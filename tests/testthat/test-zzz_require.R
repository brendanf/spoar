withr::with_temp_libpaths(
    test_that("requireXX() works", {
        unloadNamespace("dada2")
        unloadNamespace("ShortRead")
        unloadNamespace("GenomicAlignments")
        unloadNamespace("Rsamtools")
        unloadNamespace("Biostrings")
        expect_false("Biostrings" %in% loadedNamespaces())
        # expect_error(
        #     requireBiostrings(),
        #     "Operating on XStringSet objects requires the 'Biostrings' package."
        # )
        expect_false("ShortRead" %in% loadedNamespaces())
        # expect_error(
        #     requireShortRead(),
        #     "Operating on ShortRead objects requires the 'ShortRead' package."
        # )
    }),
    action = "replace"
)
