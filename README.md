# Leetcode

Solutions to leetcode problems implemented in **[Swift](https://www.swift.org/)**

![swift logo](https://www.swift.org/assets/images/swift.svg)

![swift test](https://github.com/rossmassey/leetcode/actions/workflows/swift.yml/badge.svg)

  ## Documentation

Documentation is generated from the markdown in the solution files, with the DocC documentation compiler

#### [Overview](https://rossmassey.github.io/leetcode/documentation/leetcode/)

#### [Article: Problems organized by Neetcode's Roadmap](https://rossmassey.github.io/leetcode/documentation/leetcode/index)

## Testing

XCTests can be ran through Xcode or VS Code (with Swift extension), or with:

```
swift test
```

> Note: Current test cases are just the example inputs/outputs provided by Leetcode, and are not comprehensive

## Adding new solution and test case

Run the following interactive script to to generate a blank leetcode solution and test case

```
swift Scripts/start-new-problem.swift
```
## Generating Documentation

To generate the static documentation in `/docs`, from the repo folder run:

```
bash Scripts/generate-docs.sh
```

To preview the web version, run:

```
bash Scripts/preview-docs.sh
```

[GitHub Pages](https://pages.github.com/) is used to host the static content generated in the `/docs` folder from the `docs` branch (to avoid GitHub action running everytime commit pushed to `main`)

