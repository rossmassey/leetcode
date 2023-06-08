# Leetcode

## [Documentation](https://rossmassey.github.io/leetcode/documentation/leetcode/)

## Testing

XCTests can be ran through Xcode or VS Code (with Swift extension), or with:

```
swift test
```

## Adding new solution and test case

Run the following interactive script to to generate a blank leetcode solution and test case

```
swift Scripts/start-new-problem.swift
```

> Note: Current test cases are just the example inputs/outputs provided by Leetcode, and are not comprehensive

## Documentation

To generate the static documentation in `/docs`, from the repo folder run:

```
bash Scripts/generate-docs.sh
```

To preview the web version, run:

```
bash Scripts/preview-docs.sh
```
