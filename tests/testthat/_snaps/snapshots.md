# spoaConsensus does not regress

    "CATAAAAGAACGTAGTCGCCTGTCCGTAATCTGTCGATTCACCGGAAGAGGACCCGTAAAGTGATAATGATATCATACAT"

---

    "CATAAAAGAACGTAGTCGCCTGTCCGTAACCTGTCGGATTCACCGGAAGAGGACCCGTAAAGTGATAATGATTATCATCTACAT"

---

    "CATAAAAGAACGTAGTCGCCTGTCCGTAACCTGTCGGATCACCGGAAATGGGACCCGTAAAGTGATAATGATTATCATCTACAT"

---

    "GTCATAAAGGCAACGTGTAGGTCGCCCTGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGATTATCATCTACAT"

---

    "CATAAAGGCAACGTGTAGGTCGCCCTGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGATTAT"

---

    "CATAAAGGCAACGTGTAGGTCGCCCTGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGATTATCATCTACAT"

---

    "GTCATAAAGGCAACGTGTAGGTCGCCCTGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGATTATCATCTACAT"

---

    "CATAAAGGCAACGTGTAGGTCGCCCTGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGATTAT"

---

    "CATAAAGGCAACGTGTAGGTCGCCCTGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGATTATCATCTACAT"

# spoaAlign does not regress

    {
      "type": "character",
      "attributes": {},
      "value": ["CATA-AA-AGA---A-CGT-AGGTCGCCCGTCCGTAACCT-GTCGG-A---TCAC--CGG-AA--A--G-G--A-CC--CGTAAAGT-GATAATG------A--T----", "-AT--AA-AG-------GC-A-GTCG--C-TCTGTAAGCT-GTC-G-A-T-TCAC--CGGAAA-GATGGCGTTA-CC-ACGTAAAGT-GATAATGA-T-T-A--T----", "-AT-CAA-AGA---A-CGT---GTAGCCTGTCCGTAATCTAG-C-GCATT-TCAC-AC-G--A-GA---C-----CCG-CGT-AA-T-G-----G---------G----", "CGTA-AATAG-------GT-A-AT-G--A-T-TATCAT-TA--C---A-TATCACAAC-T--A-G---G-G-----C--CGT-AT-T-AATCATGA-TATCA--T-CA-", "-GT-CGCTAGAGGCATCGTGA-GTCG-CT-TCCGT-ACC--G-C---A-----A----GG--ATGA---CG--AGTC-ACTTAAAGT-GATAAT---------------", "C---C------------GT-A-A-----C--CT-TCATC--G---G-A---TCAC--CGG-AA--A--G-G--A-CC--CGTAAA-TAGA-CCTGATTATCATCTACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["CA--TA-AA------AGA---A-CGT-AGGTCGCCCGTCCGTAACC-T--GTCGG-A---TCAC--CGG-AA--A--G-G--A-CC--CGTAAAGTGATAATGAT-----------------", "-A--T--AA------AG-------GC-A-GTCG--C-TCTGTAAGC-T--GTC-G-A-T-TCAC--CGGAAA-GATGGCGTTA-CC-ACGTAAAGTGATAATGATTAT--------------", "-A--T-CAA------AGA---A-CGT---GTAGCCTGTCCGTAATC-T-AG-C-GCATT-TCAC-AC-G--A-GA---C-----CCG-CGTAA---------------TGGG----------", "--CGTA-AA-----TAG-------GT-A-AT-G--A-T-TATCAT--T-A--C---A-TATCACAAC-T--A-G---G-G-----C--CGT--ATTAATCATGA-TAT----CATCA-----", "---------GTCGCTAGAGGCATCGTGA-GTCG-CT-TCCGT-ACC----G-C---A-----A----GG--ATGA---CG--AGTC-ACTTAAAGTGATAAT--------------------", "--------------------------------------CCGTAACCTTCA-TCGG-A---TCAC--CGG-AA--A--G-G--A-CC--CGTAAATAGA-CCTGATTAT----CATC-TACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["CATA-AA-AGA---A-CGT-AGGTCGCCCGTCCGTAACC-T--GTC--GG-A---TCAC--CGG-AA-A--G-G--AC-C-CGTAAAGTGA-TA-ATGAT----------------", "-AT--AA-AG-------GC-A-GTCG--C-TCTGTAAGC-T--GTC---G-A-T-TCAC--CGGAAAGATGGCGTTAC-CACGTAAAGTGA-TA-ATGAT--TAT-----------", "-AT-CAA-AGA---A-CGT---GTAGCCTGTCCGTAATC-T-AG-C---GCATT-TCAC-AC-G----A----G--AC-C-C-----GCG--TA-ATG-------GG---------", "CGTA-AATAG-------GT-A-AT-G--A-T-TATCAT--T-A--C-----A-TATCACAAC-T----A-GG-G-----C-C-----GT-ATTA-ATCATGATAT--CATC-A---", "-GT-CGCTAGAGGCATCGTGA-GTCG-CT-TCCGT-ACC----G-CAAGG-A---TGA---C-G----A----G----TCACTTAAAGTGA-TA-AT-------------------", "-------------------------------CCGTAACCTTCA-TC--GG-A---TCAC--CGG-AA-A--G-G--AC-C-CGTAAA-T-A-GACCTGAT--TAT--CATCTACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["--CA-TA-AAAG--AAC--GTAGGTCGCCC-GTCCGTAACCT---GTC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAAAGT-GATA----A--TG---AT---------", "---A-T--AAAGGCA--------GTCGC----TCTGTAAGCT---GTC---G-A-T-TCA--------C-CGGAA--AGATGGCGTTACC--ACGTAAAGT-GATA----A--TGATTAT---------", "---A-T-CAAAG--AACGTGTAG-----CCTGTCCGTAATCT--AG-C---GCATT-TCA--------CACG--A------G-----ACCCG-CGTAA--TGG-----------G--------------", "--CG-T--AAA---------TAG------------GTAAT-----------G-ATTATCATTACATATCAC--AACTAG--GG------C---CGTA---T---TA-ATCA--TGA-TATCATC-A---", "GTCGCT--AGAGGCATCGTG-A-GTCG--CT-TCCGT-ACC----G-CAAGG-A---T-------------G--AC--GA----GT---C--ACTTAAAGT-GATA----A--T---------------", "---------------------------------CCGTAACCTTCA-TC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAA-----ATAG---ACCTGATTATCATCTACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["CA------TA-AAAG--AAC--GTAGGTCGCCC-GTCCGTAACCT-GTC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTA------AAG---TGA-TA--ATGAT------------", "-A------T--AAAGGCA--------GTCGC----TCTGTAAGCT-GTC---G-A-T-TCA--------C-CGGAA--AGATGGCGTTACC--ACGTA------AAG---TGA-TA--ATGATTAT---------", "-A------T-CAAAG--AACGTGTAG-----CCTGTCCGTAATCTAG-C---GCATT-TCA--------CACG--A------G-----ACCCG-CGTA------A-----TG--------------GG-------", "-----CG-T--AAA---------TAG------------GTAAT---------G-ATTATCATTACATATCAC--AACTAG--GG------C---CGTATTAATCA-----TGA-TATCAT--------CA-----", "---GTCGCT--AGAGGCATCGTG-A-GTCG--CT-TCCGT-ACC--G-CAAGG-A---T-------------G--AC--GA----GT---C--AC---TTA---AAG---TGA-TA--AT---------------", "--C--CG-T--AA------------------CCT-TC----A-----TC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTA--AAT--AGACCTGATTATCAT--------C-TACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["CATA----AAAG--AAC--GTAGGTCGCCC-GTCCGTAACCT---GTC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAAAGTGATA----A--TGAT---------------", "-AT-----AAAGGCA--------GTCGC----TCTGTAAGCT---GTC---G-A-T-TCA--------C-CGGAA--AGATGGCGTTACC--ACGTAAAGTGATA----A--TGATTAT------------", "-AT-C---AAAG--AACGTGTAG-----CCTGTCCGTAATCT--AG-C---GCATT-TCA--------CACG--A------G-----ACCCG-CGTA--------------------ATGGG---------", "CGT-----AAA---------TAG------------GTAAT-----------G-ATTATCATTACATATCAC--AACTAG--GG------C---CGTA---T--TA-ATCA--TGA-TAT---CATC-A---", "-GT-CGCTAGAGGCATCGTG-A-GTCG--CT-TCCGT-ACC----G-CAAGG-A---T-------------G--AC--GA----GT---C--ACTTAAAGTGATA----A--T------------------", "---------------------------------CCGTAACCTTCA-TC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAA----ATAG---ACCTGATTAT---CATCTACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["--CA-TA-AAAG--AAC--GTAGGTCGCCC-GTCCGTAACCT---GTC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAAAGT-GATA----A--TG---AT---------", "---A-T--AAAGGCA--------GTCGC----TCTGTAAGCT---GTC---G-A-T-TCA--------C-CGGAA--AGATGGCGTTACC--ACGTAAAGT-GATA----A--TGATTAT---------", "---A-T-CAAAG--AACGTGTAG-----CCTGTCCGTAATCT--AG-C---GCATT-TCA--------CACG--A------G-----ACCCG-CGTAA--TGG-----------G--------------", "--CG-T--AAA---------TAG------------GTAAT-----------G-ATTATCATTACATATCAC--AACTAG--GG------C---CGTA---T---TA-ATCA--TGA-TATCATC-A---", "GTCGCT--AGAGGCATCGTG-A-GTCG--CT-TCCGT-ACC----G-CAAGG-A---T-------------G--AC--GA----GT---C--ACTTAAAGT-GATA----A--T---------------", "---------------------------------CCGTAACCTTCA-TC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAA-----ATAG---ACCTGATTATCATCTACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["CA------TA-AAAG--AAC--GTAGGTCGCCC-GTCCGTAACCT-GTC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTA------AAG---TGA-TA--ATGAT------------", "-A------T--AAAGGCA--------GTCGC----TCTGTAAGCT-GTC---G-A-T-TCA--------C-CGGAA--AGATGGCGTTACC--ACGTA------AAG---TGA-TA--ATGATTAT---------", "-A------T-CAAAG--AACGTGTAG-----CCTGTCCGTAATCTAG-C---GCATT-TCA--------CACG--A------G-----ACCCG-CGTA------A-----TG--------------GG-------", "-----CG-T--AAA---------TAG------------GTAAT---------G-ATTATCATTACATATCAC--AACTAG--GG------C---CGTATTAATCA-----TGA-TATCAT--------CA-----", "---GTCGCT--AGAGGCATCGTG-A-GTCG--CT-TCCGT-ACC--G-CAAGG-A---T-------------G--AC--GA----GT---C--AC---TTA---AAG---TGA-TA--AT---------------", "--C--CG-T--AA------------------CCT-TC----A-----TC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTA--AAT--AGACCTGATTATCAT--------C-TACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["CATA----AAAG--AAC--GTAGGTCGCCC-GTCCGTAACCT---GTC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAAAGTGATA----A--TGAT---------------", "-AT-----AAAGGCA--------GTCGC----TCTGTAAGCT---GTC---G-A-T-TCA--------C-CGGAA--AGATGGCGTTACC--ACGTAAAGTGATA----A--TGATTAT------------", "-AT-C---AAAG--AACGTGTAG-----CCTGTCCGTAATCT--AG-C---GCATT-TCA--------CACG--A------G-----ACCCG-CGTA--------------------ATGGG---------", "CGT-----AAA---------TAG------------GTAAT-----------G-ATTATCATTACATATCAC--AACTAG--GG------C---CGTA---T--TA-ATCA--TGA-TAT---CATC-A---", "-GT-CGCTAGAGGCATCGTG-A-GTCG--CT-TCCGT-ACC----G-CAAGG-A---T-------------G--AC--GA----GT---C--ACTTAAAGTGATA----A--T------------------", "---------------------------------CCGTAACCTTCA-TC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAA----ATAG---ACCTGATTAT---CATCTACAT"]
    }

# weighted spoaConsensus does not regress

    "CGTCGCTAGAGGCATCGTAGTCGCTTCCGTCATCGCATCACCGGAAGAGGACCCGTAAATGATAATGATTATCATCTACAT"

---

    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTAACCTTATCATCACCGGAAGAGGACCCGTAAAGTGATAATGATTATCATCTACAT"

---

    "CGTCGCTAGAGGCATCGTGAGTCGCTTCCGTAACCTTATCGGATCACCGGAGGACCCGTAAAGTATAATGATTATCATCTACAT"

---

    "GTCGCTAAATAGTCGCTTCCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAAGTGATAATGATTATCATCTACAT"

---

    "CCGTAACCTTCCGTAATCGGATCACCGGAAAGGACCCTTAAAGTGATATCATCTACAT"

---

    "CGTAAATAGTCGCTTCCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAAGTGATAATGATTATCATCTACAT"

---

    "GTCGCTAAATAGTCGCTTCCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAAGTGATAATGATTATCATCTACAT"

---

    "CCGTAACCTTCCGTAATCGGATCACCGGAAAGGACCCTTAAAGTGATATCATCTACAT"

---

    "CGTAAATAGTCGCTTCCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAAGTGATAATGATTATCATCTACAT"

# weighted spoaAlign does not regress

    {
      "type": "character",
      "attributes": {},
      "value": ["CATA-AA-AGA---A-CGT-AGGTCGCCCGTCCGTAACCT-GTCGG-A---TCAC--CGG-AA--A--G-G--A-CC--CGTAAAGT-GATAATG------A--T----", "-AT--AA-AG-------GC-A-GTCG--C-TCTGTAAGCT-GTC-G-A-T-TCAC--CGGAAA-GATGGCGTTA-CC-ACGTAAAGT-GATAATGA-T-T-A--T----", "-AT-CAA-AGA---A-CGT---GTAGCCTGTCCGTAATCTAG-C-GCATT-TCAC-AC-G--A-GA---C-----CCG-CGT-AA-T-G-----G---------G----", "CGTA-AATAG-------GT-A-AT-G--A-T-TATCAT-TA--C---A-TATCACAAC-T--A-G---G-G-----C--CGT-AT-T-AATCATGA-TATCA--T-CA-", "-GT-CGCTAGAGGCATCGTGA-GTCG-CT-TCCGT-ACC--G-C---A-----A----GG--ATGA---CG--AGTC-ACTTAAAGT-GATAAT---------------", "C---C------------GT-A-A-----C--CT-TCATC--G---G-A---TCAC--CGG-AA--A--G-G--A-CC--CGTAAA-TAGA-CCTGATTATCATCTACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["CA--TA-AA------AGA---A-CGT-AGGTCGCCCGTCCGTAACC-T--GTCGG-A---TCAC--CGG-AA--A--G-G--A-CC--CGTAAAGTGATAATGAT-----------------", "-A--T--AA------AG-------GC-A-GTCG--C-TCTGTAAGC-T--GTC-G-A-T-TCAC--CGGAAA-GATGGCGTTA-CC-ACGTAAAGTGATAATGATTAT--------------", "-A--T-CAA------AGA---A-CGT---GTAGCCTGTCCGTAATC-T-AG-C-GCATT-TCAC-AC-G--A-GA---C-----CCG-CGTAA---------------TGGG----------", "--CGTA-AA-----TAG-------GT-A-AT-G--A-T-TATCAT--T-A--C---A-TATCACAAC-T--A-G---G-G-----C--CGT--ATTAATCATGA-TAT----CATCA-----", "---------GTCGCTAGAGGCATCGTGA-GTCG-CT-TCCGT-ACC----G-C---A-----A----GG--ATGA---CG--AGTC-ACTTAAAGTGATAAT--------------------", "--------------------------------------CCGTAACCTTCA-TCGG-A---TCAC--CGG-AA--A--G-G--A-CC--CGTAAATAGA-CCTGATTAT----CATC-TACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["CATA-AA-AGA---A-CGT-AGGTCGCCCGTCCGTAACC-T--GTC--GG-A---TCAC--CGG-AA-A--G-G--AC-C-CGTAAAGTGA-TA-ATGAT----------------", "-AT--AA-AG-------GC-A-GTCG--C-TCTGTAAGC-T--GTC---G-A-T-TCAC--CGGAAAGATGGCGTTAC-CACGTAAAGTGA-TA-ATGAT--TAT-----------", "-AT-CAA-AGA---A-CGT---GTAGCCTGTCCGTAATC-T-AG-C---GCATT-TCAC-AC-G----A----G--AC-C-C-----GCG--TA-ATG-------GG---------", "CGTA-AATAG-------GT-A-AT-G--A-T-TATCAT--T-A--C-----A-TATCACAAC-T----A-GG-G-----C-C-----GT-ATTA-ATCATGATAT--CATC-A---", "-GT-CGCTAGAGGCATCGTGA-GTCG-CT-TCCGT-ACC----G-CAAGG-A---TGA---C-G----A----G----TCACTTAAAGTGA-TA-AT-------------------", "-------------------------------CCGTAACCTTCA-TC--GG-A---TCAC--CGG-AA-A--G-G--AC-C-CGTAAA-T-A-GACCTGAT--TAT--CATCTACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["--CA-TA-AAAG--AAC--GTAGGTCGCCC-GTCCGTAACCT---GTC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAAAGT-GATA----A--TG---AT---------", "---A-T--AAAGGCA--------GTCGC----TCTGTAAGCT---GTC---G-A-T-TCA--------C-CGGAA--AGATGGCGTTACC--ACGTAAAGT-GATA----A--TGATTAT---------", "---A-T-CAAAG--AACGTGTAG-----CCTGTCCGTAATCT--AG-C---GCATT-TCA--------CACG--A------G-----ACCCG-CGTAA--TGG-----------G--------------", "--CG-T--AAA---------TAG------------GTAAT-----------G-ATTATCATTACATATCAC--AACTAG--GG------C---CGTA---T---TA-ATCA--TGA-TATCATC-A---", "GTCGCT--AGAGGCATCGTG-A-GTCG--CT-TCCGT-ACC----G-CAAGG-A---T-------------G--AC--GA----GT---C--ACTTAAAGT-GATA----A--T---------------", "---------------------------------CCGTAACCTTCA-TC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAA-----ATAG---ACCTGATTATCATCTACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["CA------TA-AAAG--AAC--GTAGGTCGCCC-GTCCGTAACCT-GTC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTA------AAG---TGA-TA--ATGAT------------", "-A------T--AAAGGCA--------GTCGC----TCTGTAAGCT-GTC---G-A-T-TCA--------C-CGGAA--AGATGGCGTTACC--ACGTA------AAG---TGA-TA--ATGATTAT---------", "-A------T-CAAAG--AACGTGTAG-----CCTGTCCGTAATCTAG-C---GCATT-TCA--------CACG--A------G-----ACCCG-CGTA------A-----TG--------------GG-------", "-----CG-T--AAA---------TAG------------GTAAT---------G-ATTATCATTACATATCAC--AACTAG--GG------C---CGTATTAATCA-----TGA-TATCAT--------CA-----", "---GTCGCT--AGAGGCATCGTG-A-GTCG--CT-TCCGT-ACC--G-CAAGG-A---T-------------G--AC--GA----GT---C--AC---TTA---AAG---TGA-TA--AT---------------", "--C--CG-T--AA------------------CCT-TC----A-----TC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTA--AAT--AGACCTGATTATCAT--------C-TACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["CATA----AAAG--AAC--GTAGGTCGCCC-GTCCGTAACCT---GTC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAAAGTGATA----A--TGAT---------------", "-AT-----AAAGGCA--------GTCGC----TCTGTAAGCT---GTC---G-A-T-TCA--------C-CGGAA--AGATGGCGTTACC--ACGTAAAGTGATA----A--TGATTAT------------", "-AT-C---AAAG--AACGTGTAG-----CCTGTCCGTAATCT--AG-C---GCATT-TCA--------CACG--A------G-----ACCCG-CGTA--------------------ATGGG---------", "CGT-----AAA---------TAG------------GTAAT-----------G-ATTATCATTACATATCAC--AACTAG--GG------C---CGTA---T--TA-ATCA--TGA-TAT---CATC-A---", "-GT-CGCTAGAGGCATCGTG-A-GTCG--CT-TCCGT-ACC----G-CAAGG-A---T-------------G--AC--GA----GT---C--ACTTAAAGTGATA----A--T------------------", "---------------------------------CCGTAACCTTCA-TC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAA----ATAG---ACCTGATTAT---CATCTACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["--CA-TA-AAAG--AAC--GTAGGTCGCCC-GTCCGTAACCT---GTC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAAAGT-GATA----A--TG---AT---------", "---A-T--AAAGGCA--------GTCGC----TCTGTAAGCT---GTC---G-A-T-TCA--------C-CGGAA--AGATGGCGTTACC--ACGTAAAGT-GATA----A--TGATTAT---------", "---A-T-CAAAG--AACGTGTAG-----CCTGTCCGTAATCT--AG-C---GCATT-TCA--------CACG--A------G-----ACCCG-CGTAA--TGG-----------G--------------", "--CG-T--AAA---------TAG------------GTAAT-----------G-ATTATCATTACATATCAC--AACTAG--GG------C---CGTA---T---TA-ATCA--TGA-TATCATC-A---", "GTCGCT--AGAGGCATCGTG-A-GTCG--CT-TCCGT-ACC----G-CAAGG-A---T-------------G--AC--GA----GT---C--ACTTAAAGT-GATA----A--T---------------", "---------------------------------CCGTAACCTTCA-TC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAA-----ATAG---ACCTGATTATCATCTACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["CA------TA-AAAG--AAC--GTAGGTCGCCC-GTCCGTAACCT-GTC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTA------AAG---TGA-TA--ATGAT------------", "-A------T--AAAGGCA--------GTCGC----TCTGTAAGCT-GTC---G-A-T-TCA--------C-CGGAA--AGATGGCGTTACC--ACGTA------AAG---TGA-TA--ATGATTAT---------", "-A------T-CAAAG--AACGTGTAG-----CCTGTCCGTAATCTAG-C---GCATT-TCA--------CACG--A------G-----ACCCG-CGTA------A-----TG--------------GG-------", "-----CG-T--AAA---------TAG------------GTAAT---------G-ATTATCATTACATATCAC--AACTAG--GG------C---CGTATTAATCA-----TGA-TATCAT--------CA-----", "---GTCGCT--AGAGGCATCGTG-A-GTCG--CT-TCCGT-ACC--G-CAAGG-A---T-------------G--AC--GA----GT---C--AC---TTA---AAG---TGA-TA--AT---------------", "--C--CG-T--AA------------------CCT-TC----A-----TC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTA--AAT--AGACCTGATTATCAT--------C-TACAT"]
    }

---

    {
      "type": "character",
      "attributes": {},
      "value": ["CATA----AAAG--AAC--GTAGGTCGCCC-GTCCGTAACCT---GTC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAAAGTGATA----A--TGAT---------------", "-AT-----AAAGGCA--------GTCGC----TCTGTAAGCT---GTC---G-A-T-TCA--------C-CGGAA--AGATGGCGTTACC--ACGTAAAGTGATA----A--TGATTAT------------", "-AT-C---AAAG--AACGTGTAG-----CCTGTCCGTAATCT--AG-C---GCATT-TCA--------CACG--A------G-----ACCCG-CGTA--------------------ATGGG---------", "CGT-----AAA---------TAG------------GTAAT-----------G-ATTATCATTACATATCAC--AACTAG--GG------C---CGTA---T--TA-ATCA--TGA-TAT---CATC-A---", "-GT-CGCTAGAGGCATCGTG-A-GTCG--CT-TCCGT-ACC----G-CAAGG-A---T-------------G--AC--GA----GT---C--ACTTAAAGTGATA----A--T------------------", "---------------------------------CCGTAACCTTCA-TC--GG-A---TCA--------C-CGGAA--AG--G-----ACC---CGTAA----ATAG---ACCTGATTAT---CATCTACAT"]
    }

