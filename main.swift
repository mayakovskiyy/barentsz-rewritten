import Foundation

var charLib: [String] = ["A", "a", "B", "b", "C", "c", "D", "d", "E", "e", "F", "f", "G", "g", "H", "h", "I", "i", "J", "j", "K", "k", "L", "l", "M", "m", "N", "n", "O", "o", "P", "p", "Q", "q", "R", "r", "S", "s", "T", "t", "U", "u", "V", "v", "W", "w", "X", "x", "Y", "y", "Z", "z", "!", "?", "/", "@", "#", "$", "%", ":", "^", "&", "*", "(", ")", "_", "-", "+", "=", "~", "`", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

var length: String = ""

print("Password Length:")
var lengthInput = Int(readLine()!)!

for _ in 1...lengthInput {
    let symbol: String? = charLib.randomElement();
    length += symbol!
}
print(" ")
print("Generated Password: \(length)")
print(" ")
print("Thank you for using Barentsz Rewritten 0.1!")
print("Support our project on GitHub: https://github.com/mayakovskiyy/barentsz-rewritten")
print("2026, Danketsu Studio©")
