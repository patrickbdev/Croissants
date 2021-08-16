import XCTest
@testable import Croissants
import ViewInspector

extension Sprint04View: IdentifierInspectable {
    typealias Identifier = Self.Identifier
}

class Sprint04View_Tests: XCTestCase {

    func test() throws {
        typealias Croissant = Sprint04View.Croissant
        
        // GIVEN I'd like to favourite a croissant
        
        // WHEN I view my screen of 3 croissants (plain, chocolate, almond)
        let croissants = [
            Croissant(name: "Plain", image: "croissant-plain"),
            Croissant(name: "Chocolate", image: "croissant-chocolate"),
            Croissant(name: "Almond", image: "croissant-almond"),
        ]
        let screen = Sprint04View(repository: .init(croissants: croissants))
        
        // THEN I’m given the ability to favourite
        let buttons = try screen.views(for: .button)
        XCTAssertEqual(buttons.count, 3)
        XCTAssertEqual(try buttons[0].button().labelView().image().actualImage().name(), "star")
        XCTAssertEqual(try buttons[1].button().labelView().image().actualImage().name(), "star")
        XCTAssertEqual(try buttons[2].button().labelView().image().actualImage().name(), "star")
    }
}
