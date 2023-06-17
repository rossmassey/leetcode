#!/bin/bash
pwd # adding for testing 

swift package --allow-writing-to-directory ./_site \
    generate-documentation --target leetcode \
    --disable-indexing \
    --transform-for-static-hosting \
    --hosting-base-path leetcode \
    --output-path ./_site \
    --source-service github \
    --source-service-base-url https://github.com/rossmassey/leetcode/blob/main \
    --checkout-path /home/runner/work/leetcode/leetcode # absolute path of checked out reposistory
