import UIKit
import Foundation
import Darwin

var num = "01010101010"
var nsnum = NSString(string:num)
var pattern = "(?<=010[0-9]{2,4})([0-9])(?=[0-9]{3})"
var regex = try? NSRegularExpression(pattern: pattern, options: [])
var range = NSRange(location: 0, length: num.count)
var result = regex?.matches(in: num, options: [], range: range)
print(type(of: result))
var answer :String

answer = num.replacingOccurrences(of: "(?<=010[0-9]{2,4})([0-9])(?=[0-9]{3})", with: "*", options: .regularExpression)
print(answer)


var str = "010-1234-2222"
str = str.components(separatedBy: ["-"]).joined()

print(str)
