import XCTest
@testable import Croissants
import ViewInspector

extension Sprint05View: IdentifierInspectable {
    typealias Identifier = Self.Identifier
}

class Sprint05View_Tests: XCTestCase {

    func test() throws {
        typealias Croissant = Sprint05View.Croissant
        
        // GIVEN I can see 3 croissants in my screen (plain, chocolate, almond)
        let croissants = [
            Croissant(name: "Plain", image: "croissant-plain", isStarred: false),
            Croissant(name: "Chocolate", image: "croissant-chocolate", isStarred: false),
            Croissant(name: "Almond", image: "croissant-almond", isStarred: false),
        ]
        let screen = Sprint05View(repository: .init(croissants: croissants))
        
        // WHEN I favourite a croissant
        let chocolate = try screen.views(for: .button)[1]
        try chocolate.button().tap()
        
        // THEN I see that croissant has been favourited
        let buttons = try screen.views(for: .button)
        XCTAssertEqual(try buttons[0].button().labelView().image().foregroundColor(), .gray)
        XCTAssertEqual(try buttons[1].button().labelView().image().foregroundColor(), .yellow)
        XCTAssertEqual(try buttons[2].button().labelView().image().foregroundColor(), .gray)
    }
}
