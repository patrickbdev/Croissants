import XCTest
@testable import Croissants

extension ContentView: IdentifierInspectable {}

class CroissantsTests: XCTestCase {

    func test_viewing() throws {
        
        // GIVEN I know of 3 croissants (plain, chocolate, almond)
        let croissants: [Croissant] = [
            .init(name: "Plain", image: "croissant-plain"),
            .init(name: "Chocolate", image: "croissant-chocolate"),
            .init(name: "Almond", image: "croissant-almond")
        ]
        
        // WHEN I view my screen
        let screen = ContentView(repository: .init(croissants: croissants))
        
        // THEN I can see these 3 croissant names and images
        let rows = try screen.views(for: .row)
        XCTAssertEqual(try rows[0].label().title().text().string(), "Plain")
        XCTAssertEqual(try rows[0].label().icon().image().actualImage().name(), "croissant-plain")
        XCTAssertEqual(try rows[1].label().title().text().string(), "Chocolate")
        XCTAssertEqual(try rows[1].label().icon().image().actualImage().name(), "croissant-chocolate")
        XCTAssertEqual(try rows[2].label().title().text().string(), "Almond")
        XCTAssertEqual(try rows[2].label().icon().image().actualImage().name(), "croissant-almond")
    }
    
    func test_deleting() throws {
        
        // GIVEN I can see 3 croissants in my screen (plain, chocolate, almond)
        let croissants: [Croissant] = [
            .init(name: "Plain", image: "croissant-plain"),
            .init(name: "Chocolate", image: "croissant-chocolate"),
            .init(name: "Almond", image: "croissant-almond")
        ]
        
        // WHEN I remove any
        let screen = ContentView(repository: .init(croissants: croissants))
        try screen.view(for: .forEach).forEach().callOnDelete([1])
        
        // THEN I only see the remaining croissants
        let rows = try screen.views(for: .row)
        XCTAssertEqual(rows.count, 2)
        XCTAssertEqual(try rows[0].label().title().text().string(), "Plain")
        XCTAssertEqual(try rows[0].label().icon().image().actualImage().name(), "croissant-plain")
        XCTAssertEqual(try rows[1].label().title().text().string(), "Almond")
        XCTAssertEqual(try rows[1].label().icon().image().actualImage().name(), "croissant-almond")
    }
    
    func test_favouriting() throws {
        // GIVEN I'd like to favourite a croissant
        
        // WHEN I view my screen of 3 croissants (plain, chocolate, almond)
        let croissants: [Croissant] = [
            .init(name: "Plain", image: "croissant-plain"),
            .init(name: "Chocolate", image: "croissant-chocolate"),
            .init(name: "Almond", image: "croissant-almond")
        ]
        let screen = ContentView(repository: .init(croissants: croissants))
        
        // THEN I’m given the ability to favourite
        let buttons = try screen.views(for: .button)
        XCTAssertEqual(try buttons[0].button().labelView().image().actualImage().name(), "star")
        XCTAssertEqual(try buttons[1].button().labelView().image().actualImage().name(), "star")
        XCTAssertEqual(try buttons[2].button().labelView().image().actualImage().name(), "star")
    }
}
