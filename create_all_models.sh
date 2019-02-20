#!/usr/bin/env bash
WIKI_DUMP_DATE="20190201"

./create_model.sh no Norwegian no_NO ${WIKI_DUMP_DATE}
./create_model.sh en English   en_US ${WIKI_DUMP_DATE}
./create_model.sh da Danish    da_DK ${WIKI_DUMP_DATE}
./create_model.sh fr French    fr_FR ${WIKI_DUMP_DATE}
./create_model.sh de German    de_DE ${WIKI_DUMP_DATE}
./create_model.sh es Spanish   es_ES ${WIKI_DUMP_DATE}
./create_model.sh sv Swedish   sv_SE ${WIKI_DUMP_DATE}
