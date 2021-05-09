
#include <Rcpp.h>
#include <Biostrings_interface.h>
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

// [[Rcpp::export]]
S4 spoa_consensus_xstringset(S4 seq) {
    return seq;
}
