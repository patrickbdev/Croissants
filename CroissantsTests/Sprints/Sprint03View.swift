import XCTest
@testable import Croissants
import ViewInspector

extension Sprint03View: IdentifierInspectable {
    typealias Identifier = Self.Identifier
}

class Sprint03View_Tests: XCTestCase {

    func test() throws {
        typealias Croissant = Sprint03View.Croissant
        
        // GIVEN I can see 3 croissants in my screen (plain, chocolate, almond)
        let croissants = [
            Croissant(name: "Plain", image: "croissant-plain"),
            Croissant(name: "Chocolate", image: "croissant-chocolate"),
            Croissant(name: "Almond", image: "croissant-almond"),
        ]
        let screen = Sprint03View(repository: .init(croissants: croissants))
        
        // WHEN I remove any
        try screen.view(for: .forEach).forEach().callOnDelete([1])
        
        // THEN I only see the remaining croissants
        let rows = try screen.views(for: .label)
        XCTAssertEqual(rows.count, 2)
        XCTAssertEqual(try rows[0].label().title().text().string(), "Plain")
        XCTAssertEqual(try rows[0].label().icon().image().actualImage().name(), "croissant-plain")
        XCTAssertEqual(try rows[1].label().title().text().string(), "Almond")
        XCTAssertEqual(try rows[1].label().icon().image().actualImage().name(), "croissant-almond")
    }
}
