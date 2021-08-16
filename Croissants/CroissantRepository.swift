import Foundation

class CroissantRepository: ObservableObject {
    
    @Published private(set) var croissants: [Croissant]
    
    init(croissants: [Croissant]) {
        self.croissants = croissants
    }
    
    func remove(_ indexSets: IndexSet) {
        croissants.remove(atOffsets: indexSets)
    }
}
