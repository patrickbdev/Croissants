import SwiftUI

struct Sprint01View: View {
    
    enum Identifier: String {
        case text
    }
    
    struct Croissant: Identifiable {
        var id: String { name }
        let name: String
    }
    
    @ObservedObject var repository: CroissantRepository01
    
    var body: some View {
        List(repository.croissants) { croissant in
            Text(croissant.name)
                .identifier(Identifier.text)
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct Sprint01View_Previews: PreviewProvider {
    
    typealias Croissant = Sprint01View.Croissant
    
    static var previews: some View {
        Sprint01View(repository: .init(croissants: [
            Croissant(name: "Plain"),
            Croissant(name: "Chocolate"),
            Croissant(name: "Almond"),
        ]))
    }
}

class CroissantRepository01: ObservableObject {
    typealias Croissant = Sprint01View.Croissant
    
    @Published private(set) var croissants: [Croissant]
    
    init(croissants: [Croissant]) {
        self.croissants = croissants
    }
}
