#!/usr/bin/swift
/**
    Interactive script to generate a blank leetcode solution and test case
 
    Inputs (defaults to Xcode <#placeholders#> when not given):
        - Number: Problem number on leetcode
        - Name: Problem name
        - Difficulty: Problem difficulty (defaults Medium)
        - Function Signature: Function signature used in leetcode
 
    Creates these two files: 
        - `Sources/leetcode/####-ProblemName.swift`
        - `Tests/leetcodeTests/####-ProblemNameTests.swift`
 
    Expects `solution-template.txt` and `test-template.txt` to be in same
    directory as this script
 */

import Foundation

printTitle("Start New Problem Script")

// Constants
let SOURCES_DIRECTORY = "/../Sources/leetcode/"
let TESTS_DIRECTORY = "/../Tests/leetcodeTests/"

let SOLUTION_TEMPLATE_FILENAME = "/solution-template.txt"
let TEST_TEMPLATE_FILENAME = "/test-template.txt"

// User Inputs
let number = Int(getInputFor("Number")) ?? 0
let paddedNumber = String(format: "%04d", number)

let nameWithSpaces = getInputFor("Name")
let name = nameWithSpaces.capitalized.replacingOccurrences(of: " ", with: "")

let difficulty = getDifficulty()

let functionInput = getInputFor("Function Signature")
let (functionName, functionSignature) = parseSignature(functionInput)

// Paths
let scriptFilePath = URL(fileURLWithPath: #file)
let scriptsDirectoryPath = scriptFilePath.deletingLastPathComponent().path

// Load templates
let solutionTemplate = loadFileContent(of: SOLUTION_TEMPLATE_FILENAME, at: scriptsDirectoryPath)
let testTemplate = loadFileContent(of: TEST_TEMPLATE_FILENAME, at: scriptsDirectoryPath)

// Fill out templates
let solutionContent = solutionTemplate
    .replacingOccurrences(of: "{number}", with: String(number))
    .replacingOccurrences(of: "{nameWithSpaces}", with: nameWithSpaces)
    .replacingOccurrences(of: "{difficulty}", with: difficulty)
    .replacingOccurrences(of: "{signature}", with: functionSignature)

let testContent = testTemplate
    .replacingOccurrences(of: "{name}", with: name)
    .replacingOccurrences(of: "{function}", with: functionName)
    .replacingOccurrences(of: "{number}", with: String(number))

// Write to files
let solutionFilename = "\(paddedNumber)-\(name).swift"
let testFilename = "\(paddedNumber)-\(name)Tests.swift"

writeToFile(named: solutionFilename, at: scriptsDirectoryPath + SOURCES_DIRECTORY, content: solutionContent)
writeToFile(named: testFilename, at: scriptsDirectoryPath + TESTS_DIRECTORY, content: testContent)

printTitle("Success!")

//---------------------------------------------------------------------------//

// Helper Functions

/**
    Loads content from a file.

    - Parameter path: The path of the file to read from.
    - Returns: The contents of the file as a String if successful.
    - Throws: An error if there was a problem reading the file.
*/
func loadFileContent(of filename: String, at directory: String) -> String {
    printTitle("Loading \(filename)...")
    do {
        let content = try String(contentsOfFile: directory + filename, encoding: .utf8)
        return content
    } catch {
        print("An error occurred when reading from file: \(error)")
        exit(1)
    }
}

/**
    Writes content to file.

    - Parameter name: The filename of output.
    - Parameter content: The contents to write to the file.
    - Parameter path: The path to write the file to.
*/
func writeToFile(named filename: String, at directory: String, content: String) {
    printTitle("Writing \(filename):")
    print(content)
    do {
        try content.write(toFile: directory + filename, atomically: false, encoding: .utf8)
    } catch {
        print("An error occurred when writing to file: \(error)")
        exit(1)
    }
}

/**
    Prints a formatted title

    - Parameter title: The title to format

*/
func printTitle(_ title: String) {
    print("\n---- \(title)\n")
}


/**
    Parses a raw function signature into a tuple containing the function name and its clean signature.
 
    - Parameter rawSignature: The raw function signature string.
    - Returns: A tuple containing the function name and the clean signature.
*/
func parseSignature(_ rawSignature: String) -> (String, String) {
    guard !rawSignature.contains("<#") else { return ("<#f#>", "<#f()#>")}
    
    let trimmedSignature = rawSignature.trimmingCharacters(in: .whitespacesAndNewlines)
    let withoutFuncKeyword = trimmedSignature.replacingOccurrences(of: "func ", with: "")
    let withoutBrace = withoutFuncKeyword.replacingOccurrences(of: " {", with: "")
    let components = withoutBrace.split(separator: "(", maxSplits: 1)
    let functionName = String(components[0])
    let cleanSignature = withoutBrace

    return (functionName, cleanSignature)
}

/**
    Reads a line from the standard input, providing an alternative string if the input is empty.
 
    - Parameter label: The label to be printed as a prompt for the input.
    - Parameter template: The alternative string to be returned when the input is empty. Defaults to the value of `label` if not provided.
    - Returns: The input string from standard input, or the `template` string enclosed in "<# #>" if the input is empty.
*/
func getInputFor(_ label: String, template: String? = nil) -> String {
    print("\(label): ", terminator: "")
    let line = readLine() ?? ""
    return line.isEmpty ? "<#\(template ?? label)#>" : line
}

/**
    Reads a line from the standard input, interprets it as a difficulty level, and returns the interpreted level.

    - Returns: A string representing the difficulty level: "Easy", "Medium" (default), or "Hard".
*/

func getDifficulty() -> String {
    print("Difficulty (e/m/h): ", terminator: "")
    let input = readLine() ?? ""

    switch input.lowercased() {
    case "e":
        return "Easy"
    case "h":
        return "Hard"
    default:
        return  "Medium"
    }
}
