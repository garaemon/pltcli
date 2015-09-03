#!/bin/sh

INPUT_FILES=$(find input_docs -name '*md')
OUTPUT_DOC_DIR="docs"

mkdir -p ${OUTPUT_DOC_DIR}/images

for f in ${INPUT_FILES}
do
    ./scripts/inline_expand_markdown.py $f $OUTPUT_DOC_DIR/$(basename $f) ${OUTPUT_DOC_DIR}/images
done

mkdocs build
