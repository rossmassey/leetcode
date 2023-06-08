#!/bin/bash

swift package --allow-writing-to-directory ./docs \
    generate-documentation --target leetcode \
    --disable-indexing \
    --transform-for-static-hosting \
    --hosting-base-path leetcode \
    --output-path ./docs
