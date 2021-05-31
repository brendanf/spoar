
#include <Rcpp.h>
extern "C" {
#include <Biostrings_interface.h>
#include <IRanges_interface.h>
#include <XVector_interface.h>
#include <S4Vectors_interface.h>
}
#include "spoa/include/spoa/spoa.hpp"
using namespace Rcpp;

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

    for (std::uint32_t i = 0; i < msa.size(); i++) {
        out[i] = msa[i];
    }

    out.names() = seq.names();
    return out;
}

//[[Rcpp::export]]
std::vector<std::string> spoa_consensus_xstringset(SEXP seq) {
//code modified from Biostrings::XStringSet_class.c
    XStringSet_holder x_holder;
    int x_len, i, j;
    char* p;
    std::string ans_elt;
    std::vector<std::string> ans = std::vector<std::string>();
    Chars_holder x_elt_holder;

    x_holder = hold_XVectorList(seq);
    x_len = get_length_from_XVectorList_holder(&x_holder);
    ans.reserve(x_len);
    for (i = 0; i < x_len; i++) {
        x_elt_holder = get_elt_from_XRawList_holder(&x_holder, i);
        ans_elt = std::string(x_elt_holder.length, '.');
        for (j = 0, p = (char*)x_elt_holder.ptr; j < x_elt_holder.length; j++, p++) {
            ans_elt[j] = DNAdecode(*p);
        }
        ans.push_back(ans_elt);
    }
    return ans;
}
