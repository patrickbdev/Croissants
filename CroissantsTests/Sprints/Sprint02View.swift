import XCTest
@testable import Croissants
import ViewInspector

extension Sprint02View: IdentifierInspectable {
    typealias Identifier = Self.Identifier
}

class Sprint02View_Tests: XCTestCase {

    func test() throws {
        typealias Croissant = Sprint02View.Croissant
        
        // GIVEN I know of 3 croissants (plain, chocolate, almond)
        let croissants = [
            Croissant(name: "Plain", image: "croissant-plain"),
            Croissant(name: "Chocolate", image: "croissant-chocolate"),
            Croissant(name: "Almond", image: "croissant-almond"),
        ]
        
        // WHEN I view my screen
        let screen = Sprint02View(repository: .init(croissants: croissants))
        
        // THEN I can see these 3 croissant images
        let rows = try screen.views(for: .label)
        XCTAssertEqual(rows.count, 3)
        XCTAssertEqual(try rows[0].label().title().text().string(), "Plain")
        XCTAssertEqual(try rows[0].label().icon().image().actualImage().name(), "croissant-plain")
        XCTAssertEqual(try rows[1].label().title().text().string(), "Chocolate")
        XCTAssertEqual(try rows[1].label().icon().image().actualImage().name(), "croissant-chocolate")
        XCTAssertEqual(try rows[2].label().title().text().string(), "Almond")
        XCTAssertEqual(try rows[2].label().icon().image().actualImage().name(), "croissant-almond")
    }

}
