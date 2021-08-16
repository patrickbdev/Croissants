import SwiftUI

struct ContentView: View {
    
    enum Identifier: String {
        case row
        case forEach
        case button
    }
    
    @ObservedObject var repository: CroissantRepository
    
    var body: some View {
        List {
            ForEach(repository.croissants, id: \.name) { croissant in
                HStack {
                    Label(croissant.name, image: croissant.image)
                        .identifier(Identifier.row)
                    Spacer()
                    Button {
                        print("AAA")
                    } label: {
                        Image("star")
                            .renderingMode(.template)
                            .foregroundColor(.gray)
                    }
                        .identifier(Identifier.button)
                }
            }
            .identifier(Identifier.forEach)
            .onDelete(perform: repository.remove)
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(repository: .init(croissants: [
            .init(name: "Plain", image: "croissant-plain"),
            .init(name: "Chocolate", image: "croissant-chocolate"),
            .init(name: "Almond", image: "croissant-almond")
        ]))
    }
}
