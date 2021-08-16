import XCTest
@testable import Croissants
import ViewInspector

extension Sprint01View: IdentifierInspectable {
    typealias Identifier = Self.Identifier
}

class Sprint01View_Tests: XCTestCase {

    func test() throws {
        typealias Croissant = Sprint01View.Croissant
        
        // GIVEN I know of 3 croissants (plain, chocolate, almond)
        let croissants = [
            Croissant(name: "Plain"),
            Croissant(name: "Chocolate"),
            Croissant(name: "Almond"),
        ]
        
        // WHEN I view my screen
        let screen = Sprint01View(repository: .init(croissants: croissants))
        
        // THEN I can see these 3 croissant names
        let rows = try screen.views(for: .text)
        XCTAssertEqual(rows.count, 3)
        XCTAssertEqual(try rows[0].text().string(), "Plain")
        XCTAssertEqual(try rows[1].text().string(), "Chocolate")
        XCTAssertEqual(try rows[2].text().string(), "Almond")
    }

}
