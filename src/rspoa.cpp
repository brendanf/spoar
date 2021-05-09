
#include <Rcpp.h>
// #include <Biostrings_interface.h>
// #include <XVector_interface.h>
#include "spoa/include/spoa/spoa.hpp"
using namespace Rcpp;
//
// [[Rcpp::export]]
String spoa_consensus_character(CharacterVector seq) {
    auto alignment_engine = spoa::AlignmentEngine::Create(
        spoa::AlignmentType::kNW, 3, -5, -3);

    spoa::Graph graph{};

    for (const String& it : seq) {
        std::string s = it.get_cstring();
        auto alignment = alignment_engine->Align(s, graph);
        graph.AddAlignment(alignment, s);
    }

    auto consensus = graph.GenerateConsensus();
    return consensus;
}

// [[Rcpp::export]]
CharacterVector spoa_align_character(CharacterVector seq) {
    auto alignment_engine = spoa::AlignmentEngine::Create(
        spoa::AlignmentType::kNW, 3, -5, -3);

    spoa::Graph graph{};

    for (const String& it : seq) {
        std::string s = it.get_cstring();
        auto alignment = alignment_engine->Align(s, graph);
        graph.AddAlignment(alignment, s);
    }

    std::vector<std::string> msa = graph.GenerateMultipleSequenceAlignment();
    CharacterVector out = CharacterVector(seq.length());

    for (int i = 0; i < msa.size(); i++) {
        out[i] = msa[i];
    }

    out.names() = seq.names();
    return out;
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
