import SwiftUI

extension View {
    public func identifier<T: RawRepresentable>(_ identifier: T) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where T.RawValue == String {
        accessibilityIdentifier(identifier.rawValue)
    }
}
