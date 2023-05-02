#!/usr/bin/swift

import Foundation

func loadTemplate() -> String? {
    let scriptPath = CommandLine.arguments[0]
    let scriptURL = URL(fileURLWithPath: scriptPath)
    let templateURL = scriptURL.deletingLastPathComponent().appendingPathComponent("test-template.txt")
    return try? String(contentsOf: templateURL)
}

func createTest() {
    guard CommandLine.arguments.count == 2 else {
        print("Usage: create-test.swift <path-to-file>")
        exit(1)
    }

    let inputFilePath = CommandLine.arguments[1]
    let inputFileURL = URL(fileURLWithPath: inputFilePath)

    let number = inputFileURL.deletingLastPathComponent().lastPathComponent
    let basename = inputFileURL.deletingPathExtension().lastPathComponent

    let scriptPath = CommandLine.arguments[0]
    let scriptURL = URL(fileURLWithPath: scriptPath)
    let projectURL = scriptURL.deletingLastPathComponent().deletingLastPathComponent()
    let outputDirURL = projectURL.appendingPathComponent("Tests/leetcodeTests/\(number)")

    try? FileManager.default.createDirectory(at: outputDirURL, withIntermediateDirectories: true)

    let outputFileURL = outputDirURL.appendingPathComponent("\(basename)Tests.swift")

    guard let template = loadTemplate() else {
        print("Error loading template")
        exit(1)
    }

    let contents = template
        .replacingOccurrences(of: "{number}", with: number)
        .replacingOccurrences(of: "{basename}", with: basename)

    do {
        try contents.write(to: outputFileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing output file: \(error)")
        exit(1)
    }
}

createTest()