#!/bin/bash

swift package --disable-sandbox \
    preview-documentation \
    --target leetcode \
    --source-service github \
    --source-service-base-url https://github.com/rossmassey/leetcode/blob/main \
    --checkout-path /Users/ross/Developer/leetcode # absolute path of checked out reposistory
