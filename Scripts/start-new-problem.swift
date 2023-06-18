#!/usr/bin/swift
/**
    Interactive script to generate a blank leetcode solution and test case
 
    Inputs (defaults to Xcode <#placeholders#> when not given):
        - Number: Problem number on leetcode
        - Function Signature: Function signature used in leetcode
 
    Creates these two files: 
        - `Sources/leetcode/####_ProblemName.swift`
        - `Tests/leetcodeTests/####_ProblemNameTests.swift`
 
    Expects `solution-template.txt` and `test-template.txt` in subdirectory `Templates/`
 */

import Foundation

printTitle("Start New Problem Script")

/// Constants
let SOURCES_DIRECTORY = "/../Sources/leetcode/"
let TESTS_DIRECTORY = "/../Tests/leetcodeTests/"

let SOLUTION_TEMPLATE_FILENAME = "/Templates/solution-template.txt"
let TEST_TEMPLATE_FILENAME = "/Templates/test-template.txt"

let LEETCODE_BASE_URL = "https://leetcode.com"
let PROBLEMS_API_PATH = "api/problems/all"

/// User Inputs
let number = Int(getInputFor("Number")) ?? 0
let functionInput = getInputFor("Function Signature")

/// Leetcode API
let problemSet: LeetcodeProblemSet

do {
    problemSet = try await fetchLeetcodeProblems()
} catch {
    print("Error fetching problem set: \(error)")
    exit(1)
}

/// Problem Info
guard let problemInfo = problemSet.statStatusPairs.first(where: { $0.stat.frontendQuestionId == number }) else {
    print("Problem number \(number) not found in LeetCode problems set.")
    exit(1)
}

let nameWithSpaces = problemInfo.stat.questionTitle
let difficulty = parseDifficulty(problemInfo.difficulty.level)
let url = "\(LEETCODE_BASE_URL)/problems/\(problemInfo.stat.questionTitleSlug)"

let paddedNumber = String(format: "%04d", number)
let name = nameWithSpaces.capitalized.replacingOccurrences(of: " ", with: "")
let (functionName, functionSignature) = parseSignature(functionInput)

/// Paths
let scriptFilePath = URL(fileURLWithPath: #file)
let scriptsDirectoryPath = scriptFilePath.deletingLastPathComponent().path

/// Load templates
let solutionTemplate = loadFileContent(of: SOLUTION_TEMPLATE_FILENAME, at: scriptsDirectoryPath)
let testTemplate = loadFileContent(of: TEST_TEMPLATE_FILENAME, at: scriptsDirectoryPath)

/// Fill out templates
let solutionContent = solutionTemplate
    .replacingOccurrences(of: "{url}", with: url)
    .replacingOccurrences(of: "{paddedNumber}", with: paddedNumber)
    .replacingOccurrences(of: "{nameWithSpaces}", with: nameWithSpaces)
    .replacingOccurrences(of: "{difficulty}", with: difficulty)
    .replacingOccurrences(of: "{signature}", with: functionSignature)

let testContent = testTemplate
    .replacingOccurrences(of: "{name}", with: name)
    .replacingOccurrences(of: "{function}", with: functionName)
    .replacingOccurrences(of: "{paddedNumber}", with: paddedNumber)

/// Write to files
let solutionFilename = "\(paddedNumber)_\(name).swift"
let testFilename = "\(paddedNumber)_\(name)Tests.swift"

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
    Calls the leetcode API to get information about problems

    - Returns: A ``LeetcodeProblemSet`` containing all the current leetcode problems
*/
func fetchLeetcodeProblems() async throws -> LeetcodeProblemSet {
    let url = URL(string: "\(LEETCODE_BASE_URL)/\(PROBLEMS_API_PATH)/")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let decoder = JSONDecoder()
    let problemSet = try decoder.decode(LeetcodeProblemSet.self, from: data)
    return problemSet
}

/**
    Maps an integer to a string representing the problem's difficulty level.

    - Parameter level: The integer representing the problem's difficulty level.
    - Returns: A string representing the problem's difficulty level: "Easy", "Medium" (default), or "Hard".
*/
func parseDifficulty(_ level: Int) -> String {
    switch level {
    case 1:
        return "Easy"
    case 3:
        return "Hard"
    default:
        return "Medium"
    }
}

//---------------------------------------------------------------------------//

// JSON Codables

struct LeetcodeProblemSet: Codable {
    let statStatusPairs: [StatStatusPair]

    enum CodingKeys: String, CodingKey {
        case statStatusPairs = "stat_status_pairs"
    }
}

struct StatStatusPair: Codable {
    let stat: Stat
    let difficulty: Difficulty

    enum CodingKeys: String, CodingKey {
        case stat, difficulty
    }
}

struct Stat: Codable {
    let questionTitle: String
    let questionTitleSlug: String
    let frontendQuestionId: Int

    enum CodingKeys: String, CodingKey {
        case questionTitle = "question__title"
        case questionTitleSlug = "question__title_slug"
        case frontendQuestionId = "frontend_question_id"
    }
}

struct Difficulty: Codable {
    let level: Int
}
