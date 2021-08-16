import SwiftUI

struct Sprint02View: View {
    
    enum Identifier: String {
        case label
    }
    
    struct Croissant: Identifiable {
        var id: String { name }
        let name: String
        let image: String
    }
    
    @ObservedObject var repository: CroissantRepository02
    
    var body: some View {
        List(repository.croissants) { croissant in
            Label(croissant.name, image: croissant.image)
                .identifier(Identifier.label)
        }
        .listStyle(InsetGroupedListStyle())
    }

}

struct Sprint02View_Previews: PreviewProvider {
    
    typealias Croissant = Sprint02View.Croissant
    
    static var previews: some View {
        Sprint02View(repository: .init(croissants: [
            Croissant(name: "Plain", image: "croissant-plain"),
            Croissant(name: "Chocolate", image: "croissant-chocolate"),
            Croissant(name: "Almond", image: "croissant-almond"),
        ]))
    }
}

class CroissantRepository02: ObservableObject {
    typealias Croissant = Sprint02View.Croissant
    
    @Published private(set) var croissants: [Croissant]
    
    init(croissants: [Croissant]) {
        self.croissants = croissants
    }
}
