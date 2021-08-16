//
//  Sprint05View.swift
//  Croissants
//
//  Created by patrick on 10/8/21.
//

import SwiftUI

struct Sprint05View: View {
    
    enum Identifier: String {
        case label
        case forEach
        case button
    }
    
    struct Croissant: Identifiable {
        var id: String { name }
        let name: String
        let image: String
        var isStarred: Bool
    }
    
    @ObservedObject var repository: CroissantRepository05
    
    var body: some View {
        List {
            ForEach(repository.croissants) { croissant in
                HStack {
                    Label(croissant.name, image: croissant.image)
                    Spacer()
                    Button {
                        repository.toggleFavourite(croissant)
                    } label: {
                        Image("star")
                            .renderingMode(.template)
                            .foregroundColor(croissant.isStarred ? .yellow : .gray)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .identifier(Identifier.button)
                }
            }
            .onDelete(perform: repository.remove)
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct Sprint05View_Previews: PreviewProvider {
    
    typealias Croissant = Sprint05View.Croissant
    
    static var previews: some View {
        Sprint05View(repository: .init(croissants: [
            Croissant(name: "Plain", image: "croissant-plain", isStarred: false),
            Croissant(name: "Chocolate", image: "croissant-chocolate", isStarred: false),
            Croissant(name: "Almond", image: "croissant-almond", isStarred: true),
        ]))
    }
}

class CroissantRepository05: ObservableObject {
    typealias Croissant = Sprint05View.Croissant
    
    @Published private(set) var croissants: [Croissant]
    
    init(croissants: [Croissant]) {
        self.croissants = croissants
    }
    
    func remove(_ offsets: IndexSet) {
        croissants.remove(atOffsets: offsets)
    }
    
    func toggleFavourite(_ croissant: Croissant) {
        var croissant = croissant
        croissant.isStarred.toggle()
        let index = croissants.firstIndex { $0.id == croissant.id }!
        croissants[index] = croissant
    }
}
