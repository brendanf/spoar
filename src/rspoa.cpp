#include <Rcpp.h>
// #include <Biostrings_interface.h>
// #include <XVector_interface.h>
#include "spoa/include/spoa/spoa.hpp"
using namespace Rcpp;
//

spoa::AlignmentType get_alignment_type(std::string s) {
    if (s == "local") {
        return spoa::AlignmentType::kSW;
    } else if (s == "global") {
        return spoa::AlignmentType::kNW;
    } else if (s == "semi.global") {
        return spoa::AlignmentType::kOV;
    }
    stop("Error: invalid alignment algorithm '%s'", s);
}

void spoa_linear(
        std::vector<std::string>& seq,
        spoa::AlignmentType type,
        std::int8_t m,
        std::int8_t n,
        std::int8_t g,
        spoa::Graph& graph) {
    auto alignment_engine = spoa::AlignmentEngine::Create(type, m, n, g);

    for (const std::string& s : seq) {
        auto alignment = alignment_engine->Align(s, graph);
        graph.AddAlignment(alignment, s);
    }
}

void spoa_affine(
        std::vector<std::string>& seq,
        spoa::AlignmentType type,
        std::int8_t m,
        std::int8_t n,
        std::int8_t g,
        std::int8_t e,
        spoa::Graph& graph) {
    auto alignment_engine = spoa::AlignmentEngine::Create(type, m, n, g, e);

    for (const std::string& s : seq) {
        auto alignment = alignment_engine->Align(s, graph);
        graph.AddAlignment(alignment, s);
    }
}

void spoa_convex(
        std::vector<std::string>& seq,
        spoa::AlignmentType type,
        std::int8_t m,
        std::int8_t n,
        std::int8_t g,
        std::int8_t e,
        std::int8_t q,
        std::int8_t c,
        spoa::Graph& graph) {
    auto alignment_engine = spoa::AlignmentEngine::Create(type, m, n, g, e, q, c);

    for (const std::string& s : seq) {
        auto alignment = alignment_engine->Align(s, graph);
        graph.AddAlignment(alignment, s);
    }
}

// [[Rcpp::export]]
String spoa_consensus_character(
        std::vector<std::string> seq,
        std::string algorithm,
        std::string gap_algorithm,
        int match,
        int mismatch,
        int gap_open,
        int gap_extend,
        int gap_open2,
        int gap_extend2) {
    spoa::AlignmentType type = get_alignment_type(algorithm);

    spoa::Graph graph{};
    if (gap_algorithm == "linear") {
        spoa_linear(seq, type, match, mismatch, gap_open, graph);
    } else if (gap_algorithm == "affine") {
        spoa_affine(seq, type, match, mismatch, gap_open, gap_extend, graph);
    } else if (gap_algorithm == "convex") {
        spoa_convex(seq, type, match, mismatch, gap_open, gap_extend, gap_open2,
                    gap_extend2, graph);
    } else {
        stop("Error: invalid gap algorithm '%s%'", gap_algorithm);
    }

    auto consensus = graph.GenerateConsensus();
    return consensus;
}

// [[Rcpp::export]]
std::vector<std::string> spoa_align_character(
        std::vector<std::string> seq,
        std::string algorithm,
        std::string gap_algorithm,
        int match,
        int mismatch,
        int gap_open,
        int gap_extend,
        int gap_open2,
        int gap_extend2) {
    spoa::AlignmentType type = get_alignment_type(algorithm);

    spoa::Graph graph{};
    if (gap_algorithm == "linear") {
        spoa_linear(seq, type, match, mismatch, gap_open, graph);
    } else if (gap_algorithm == "affine") {
        spoa_affine(seq, type, match, mismatch, gap_open, gap_extend, graph);
    } else if (gap_algorithm == "convex") {
        spoa_convex(seq, type, match, mismatch, gap_open, gap_extend, gap_open2,
                    gap_extend2, graph);
    } else {
        stop("Error: invalid gap algorithm '%s%'", gap_algorithm);
    }

    std::vector<std::string> msa = graph.GenerateMultipleSequenceAlignment();
    return msa;
}

// //[[Rcpp::export]]
// SEXP spoa_consensus_xstringset(SEXP seq) {
// //code modified from Biostrings::XStringSet_class.c
//     XStringSet_holder x_holder;
//     int x_len, i;
//     SEXP ans, ans_elt;
//     Chars_holder x_elt_holder;
//
//     x_holder = hold_XVectorList(seq);
//     x_len = get_length_from_XVectorList_holder(&x_holder);
//     PROTECT(ans = NEW_CHARACTER(x_len));
//     for (i = 0; i < x_len; i++) {
//         x_elt_holder = get_elt_from_XRawList_holder(&x_holder, i);
//         PROTECT(ans_elt = _new_CHARSXP_from_Chars_holder(
//             &x_elt_holder, lkup));
//         SET_STRING_ELT(ans, i, ans_elt);
//         UNPROTECT(1);
//     }
//     UNPROTECT(1);
//     return ans;
// }
