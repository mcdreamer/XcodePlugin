import Foundation

class PluginCommandHandler: NSObject {

	func removeVirtualOverrideKeywords(_ line: String) -> String {
		
		do {
			let regExp = try NSRegularExpression(pattern: "^(\\s*)virtual\\s+(.+)\\s+override\\s*$",
			                                     options: NSRegularExpression.Options.caseInsensitive)
			
			return regExp.stringByReplacingMatches(in: line,
												   options: NSRegularExpression.MatchingOptions.init(rawValue: 0),
												   range: NSRange(location: 0, length: line.characters.count),
												   withTemplate: "$1$2")
		} catch {
		
			return line
		}
	}
}
