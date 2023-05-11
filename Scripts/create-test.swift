#!/usr/bin/swift

import Foundation

func loadTemplate() -> String? {
    let scriptPath = CommandLine.arguments[0]
    let scriptURL = URL(fileURLWithPath: scriptPath)
    let templateURL = scriptURL.deletingLastPathComponent().appendingPathComponent("test-template.txt")
    return try? String(contentsOf: templateURL)
}

func loadSolutionFile() -> String? {
    let inputFilePath = CommandLine.arguments[1]
    let inputFileURL = URL(fileURLWithPath: inputFilePath)
    return try? String(contentsOf: inputFileURL)
}

func extractFunctionName(from solutionContent: String) -> String? {
    let pattern = "static func ([a-zA-Z0-9_]+)\\("
    let regex = try? NSRegularExpression(pattern: pattern, options: [])
    
    if let match = regex?.firstMatch(in: solutionContent, options: [], range: NSRange(location: 0, length: solutionContent.utf16.count)) {
        if let range = Range(match.range(at: 1), in: solutionContent) {
            return String(solutionContent[range])
        }
    }
    return nil
}

func createTest() {
    guard CommandLine.arguments.count == 2 else {
        print("Usage: create-test.swift <path-to-file>")
        exit(1)
    }

    let inputFilePath = CommandLine.arguments[1]
    let inputFileURL = URL(fileURLWithPath: inputFilePath)

    let basename = inputFileURL.deletingPathExtension().lastPathComponent
    let components = basename.components(separatedBy: "-")
    let number = components[0]
    let numberWithoutLeadingZeros = String(Int(number) ?? 0)
    let problemName = components.count > 1 ? components[1] : ""

    let scriptPath = CommandLine.arguments[0]
    let scriptURL = URL(fileURLWithPath: scriptPath)
    let projectURL = scriptURL.deletingLastPathComponent().deletingLastPathComponent()
    let outputDirURL = projectURL.appendingPathComponent("Tests/leetcodeTests")

    let outputFileURL = outputDirURL.appendingPathComponent("\(basename)Tests.swift")

    guard let template = loadTemplate() else {
        print("Error loading template")
        exit(1)
    }
    
    guard let solutionContent = loadSolutionFile() else {
        print("Error loading solution file")
        exit(1)
    }
    
    guard let functionName = extractFunctionName(from: solutionContent) else {
        print("Error extracting function name from the solution file")
        exit(1)
    }

    let contents = template
        .replacingOccurrences(of: "{number}", with: numberWithoutLeadingZeros)
        .replacingOccurrences(of: "{basename}", with: problemName)
        .replacingOccurrences(of: "{function}", with: functionName)

    do {
        try contents.write(to: outputFileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing output file: \(error)")
        exit(1)
    }
}

createTest()
