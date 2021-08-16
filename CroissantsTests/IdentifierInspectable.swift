import SwiftUI
import ViewInspector

protocol IdentifierInspectable: Inspectable {
    associatedtype Identifier: RawRepresentable where Identifier.RawValue == String
}

extension IdentifierInspectable where Self: View {
    
    func view(for identifier: Identifier) throws -> InspectableView<ViewType.ClassifiedView> {
        try inspect().find(where: { try $0.accessibilityIdentifier() == identifier.rawValue })
    }
    
    func views(for identifier: Identifier) throws -> [InspectableView<ViewType.ClassifiedView>] {
        try inspect().findAll(where: { try $0.accessibilityIdentifier() == identifier.rawValue })
    }
}
