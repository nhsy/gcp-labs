#!/bin/bash

# generate terraform-docs for modules
find ../modules/ -type d -exec bash -c 'terraform-docs --sort-by-required md "{}" > "{}"/README.md'  \;
# cleanup empty README.md files
find ../modules/ -name "README.md" -size 1c -type f -delete
