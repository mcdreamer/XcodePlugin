import XCTest

class MCDreamerPluginTests: XCTestCase {
	
	func testRemoveVirtualOverride() {
		let handler = PluginCommandHandler()
	
		var removed = handler.removeVirtualOverrideKeywords("virtual void func(int x, int y) override")
		XCTAssertEqual(removed, "void func(int x, int y)")
		
		removed = handler.removeVirtualOverrideKeywords("    virtual void func(int x, int y) override")
		XCTAssertEqual(removed, "    void func(int x, int y)")
		
		removed = handler.removeVirtualOverrideKeywords("virtual void class::func(int x, int y) override")
		XCTAssertEqual(removed, "void class::func(int x, int y)")
	}
}
