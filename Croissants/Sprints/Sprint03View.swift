import SwiftUI

struct Sprint03View: View {
    
    enum Identifier: String {
        case label
        case forEach
    }
    
    struct Croissant: Identifiable {
        var id: String { name }
        let name: String
        let image: String
    }
    
    @ObservedObject var repository: CroissantRepository03
    
    var body: some View {
        List {
            ForEach(repository.croissants) { croissant in
                Label(croissant.name, image: croissant.image)
                    .identifier(Identifier.label)
            }
            .onDelete(perform: repository.remove)
            .identifier(Identifier.forEach)
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct Sprint03View_Previews: PreviewProvider {
    typealias Croissant = Sprint03View.Croissant
    
    static var previews: some View {
        Sprint03View(repository: .init(croissants: [
            Croissant(name: "Plain", image: "croissant-plain"),
            Croissant(name: "Chocolate", image: "croissant-chocolate"),
            Croissant(name: "Almond", image: "croissant-almond"),
        ]))
    }
}

class CroissantRepository03: ObservableObject {
    typealias Croissant = Sprint03View.Croissant
    
    @Published private(set) var croissants: [Croissant]
    
    init(croissants: [Croissant]) {
        self.croissants = croissants
    }
    
    func remove(_ offsets: IndexSet) {
        croissants.remove(atOffsets: offsets)
    }
}

