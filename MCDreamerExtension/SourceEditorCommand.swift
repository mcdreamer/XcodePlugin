import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
	
	func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
		
		if (invocation.commandIdentifier.hasSuffix("removeVirtualOverride")) {
			removeVirtualOverride(invocation: invocation)
		}
		
		completionHandler(nil)
	}
	
	func removeVirtualOverride(invocation: XCSourceEditorCommandInvocation) {
	
		let handler = PluginCommandHandler()
		
		for case let range as XCSourceTextRange in invocation.buffer.selections {
			for lineNum in range.start.line...range.end.line {
				invocation.buffer.lines[lineNum] = handler.removeVirtualOverrideKeywords(invocation.buffer.lines[lineNum] as! String)
			}
		}
	}
	
}
