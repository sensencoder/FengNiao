import Foundation
import CommandLineKit
import Rainbow
import FengNiaoKit


let cli = CommandLineKit.CommandLine()

let projectOption = StringOption(
    shortFlag: "p", longFlag: "project",
    helpMessage: "Path to the project.")

let excludePathsOption =  MultiStringOption(
    shortFlag: "e", longFlag: "exclude",
    helpMessage: "Exclude paths which should not search in.")

let resourceExensionsOption = MultiStringOption(
    shortFlag: "r", longFlag: "resource-extensions",
    helpMessage: "Extensions to search.")

let fileExtensionsOption = MultiStringOption(
    shortFlag: "f",longFlag: "file-extensions",
    helpMessage: "File extensions to search with.")

let help = BoolOption(shortFlag: "h", longFlag: "help",
                      helpMessage: "Prints a help message.")

cli.addOptions(projectOption, resourceExensionsOption,fileExtensionsOption ,help)
cli.formatOutput = { s, type in
    var str: String
    switch(type) {
    case .error:
        str = s.red.bold
    case .optionFlag:
        str = s.green.underline
    case .optionHelp:
        str = s.lightBlue
    default:
        str = s
    }

    return cli.defaultFormat(s: str, type: type)
}
do {
    try cli.parse()
} catch {
    cli.printUsage(error)
    exit(EX_USAGE)
}

if help.value {
    cli.printUsage()
    exit(EX_OK)
}
let project = projectOption.value ?? "."
let resourceExtensions = resourceExensionsOption.value ?? ["png" ,"jpg" ,"imageset"]
let fileExtensions = fileExtensionsOption.value ?? ["swift" ,"m", "mm", "xib", "storyboard"]
let excludedPaths = excludePathsOption.value ?? []




