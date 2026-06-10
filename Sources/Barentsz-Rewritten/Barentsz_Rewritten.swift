import Foundation
import AppKit
import ArgumentParser

@main
struct passgen: ParsableCommand {
    
    var now = Date()
    
    var charLib: [String] = ["A", "a", "B", "b", "C", "c", "D", "d", "E", "e", "F", "f", "G", "g", "H", "h", "I", "i", "J", "j", "K", "k", "L", "l", "M", "m", "N", "n", "O", "o", "P", "p", "Q", "q", "R", "r", "S", "s", "T", "t", "U", "u", "V", "v", "W", "w", "X", "x", "Y", "y", "Z", "z", "!", "?", "/", "@", "#", "$", "%", ":", "^", "&", "*", "(", ")", "_", "-", "+", "=", "~", "`", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    
    @Argument(help: "Amount of symbols.")
    var symbAmnt: Int
    
    @Flag(help: "Copy password.")
    var copy = false
    
    @Flag(help: "Save password.")
    var save = false
    
    @Option(name: .shortAndLong, help: "Symbol to exclude from the password")
    var exclude: String
    
    mutating func run() throws {
        var length = ""
        for _ in 1...symbAmnt {
            if var symbol = charLib.randomElement() {
                if symbol != exclude {
                    length += symbol
                } else {
                    symbol = charLib.randomElement()!
                    length += symbol
                }
            }
        }
        if copy {
            let pasteboard = NSPasteboard.general
            pasteboard.clearContents()
            pasteboard.setString(length, forType: .string)
        }
        if save {
            let homeDir = FileManager.default.homeDirectoryForCurrentUser
            let docsDir = homeDir.appendingPathComponent("Documents", isDirectory: true)
            let dirURL = docsDir.appendingPathComponent("Passwords", isDirectory: true)
            
            try FileManager.default.createDirectory(at: dirURL, withIntermediateDirectories: true, attributes: nil)
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withFullDate, .withFullTime]
            
            let fileName = formatter.string(from: now).replacingOccurrences(of: ":", with: "-") + ".txt"
            let fileURL = dirURL.appendingPathComponent(fileName)
            
            try length.write(to: fileURL, atomically: true, encoding: .utf8)
            print("Password saved to: \(fileURL.path)")
        }
        
        print(" ")
        print("Generated Password: \(length)")
        print(" ")
        print("Thank you for using Barentsz Rewritten 0.21!")
        print("Support our project on GitHub: https://github.com/mayakovskiyy/barentsz-rewritten")
        print("Or on RNGit: https://git.rn-studio.ru/maya/barentsz-rewritten/\n")
        print("2026, Danketsu Studio©")
    }
}
