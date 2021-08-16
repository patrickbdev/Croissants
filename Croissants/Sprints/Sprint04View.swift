import SwiftUI

struct Sprint04View: View {
    
    enum Identifier: String {
        case label
        case forEach
        case button
    }
    
    struct Croissant: Identifiable {
        var id: String { name }
        let name: String
        let image: String
    }
    
    @ObservedObject var repository: CroissantRepository04
    
    var body: some View {
        List {
            ForEach(repository.croissants) { croissant in
                HStack {
                    Label(croissant.name, image: croissant.image)
                        .identifier(Identifier.label)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image("star")
                            .renderingMode(.template)
                            .foregroundColor(.gray)
                    }
                        .identifier(Identifier.button)
                }
            }
            .onDelete(perform: repository.remove)
            .identifier(Identifier.forEach)
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct Sprint04View_Previews: PreviewProvider {
    
    typealias Croissant = Sprint04View.Croissant
    
    static var previews: some View {
        Sprint04View(repository: .init(croissants: [
            Croissant(name: "Plain", image: "croissant-plain"),
            Croissant(name: "Chocolate", image: "croissant-chocolate"),
            Croissant(name: "Almond", image: "croissant-almond"),
        ]))
    }
}

class CroissantRepository04: ObservableObject {
    typealias Croissant = Sprint04View.Croissant
    
    @Published private(set) var croissants: [Croissant]
    
    init(croissants: [Croissant]) {
        self.croissants = croissants
    }
    
    func remove(_ offsets: IndexSet) {
        croissants.remove(atOffsets: offsets)
    }
}
