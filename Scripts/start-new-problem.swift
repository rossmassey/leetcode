#!/usr/bin/swift
/**
    Interactive script to generate a blank leetcode solution and test case
 
    Inputs:
        - Number: Problem number on leetcode
        - Name: Problem name
        - Difficulty: Problem difficulty
        - Function Signature: Function signature used in leetcode
        - Time: Big-O runtime complexity
        - Space: Big-O space complexity
 
    Creates these two files:
 
    - `Sources/leetcode/####-ProblemName.swift`
    - `Tests/leetcodeTests/####-ProblemNameTests.swift`
 
    Expects `solution-template.txt` and `test-template.txt` to be in same
    directory as this script
 */

import Foundation

// Inputs
let number = getInputFor("Number")
let paddedNumber = String(format: "%04d", Int(number) ?? 0)

let nameWithSpaces = getInputFor("Name")
let capitalized = nameWithSpaces.capitalized
let name = capitalized.replacingOccurrences(of: " ", with: "")

let difficulty = getDifficulty()

let rawFunctionSignature = getInputFor("Function Signature")
let (functionName, functionSignature) = parseSignature(rawFunctionSignature)

let timeComplexity = getInputFor("Time Complexity (e.g. n)", template: "time")
let spaceComplexity = getInputFor("Space Complexity (e.g. n log n)", template: "space")

// Paths
let scriptFilePath = URL(fileURLWithPath: #file)
let scriptsDirectoryPath = scriptFilePath.deletingLastPathComponent().path

let sourcesPath = scriptsDirectoryPath + "/../Sources/leetcode/"
let testsPath = scriptsDirectoryPath + "/../Tests/leetcodeTests/"

let solutionTemplatePath = scriptsDirectoryPath + "/solution-template.txt"
let testTemplatePath = scriptsDirectoryPath + "/test-template.txt"

// Reading templates
let solutionTemplate = try String(contentsOfFile: solutionTemplatePath, encoding: .utf8)
let testTemplate = try String(contentsOfFile: testTemplatePath, encoding: .utf8)

// Filling out templates
let solutionContent = solutionTemplate
    .replacingOccurrences(of: "{number}", with: number)
    .replacingOccurrences(of: "{nameWithSpaces}", with: nameWithSpaces)
    .replacingOccurrences(of: "{difficulty}", with: difficulty)
    .replacingOccurrences(of: "{signature}", with: functionSignature)
    .replacingOccurrences(of: "{time}", with: timeComplexity)
    .replacingOccurrences(of: "{space}", with: spaceComplexity)

let testContent = testTemplate
    .replacingOccurrences(of: "{name}", with: name)
    .replacingOccurrences(of: "{function}", with: functionName)
    .replacingOccurrences(of: "{number}", with: number)

print("\nWriting \"\(name)\"'s solution and test file...")

// Writing to files
let solutionPath = sourcesPath + paddedNumber + "-" + name + ".swift"
let testPath = testsPath + paddedNumber + "-" + name + "Tests.swift"

try solutionContent.write(toFile: solutionPath, atomically: false, encoding: .utf8)
try testContent.write(toFile: testPath, atomically: false, encoding: .utf8)

print("\nSuccess!")

//---------------------------------------------------------------------------//

// Helper Functions

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

 - Returns: A string representing the difficulty level: "Easy", "Medium", or "Hard".
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
