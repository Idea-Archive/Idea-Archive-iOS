import Foundation

struct CategoryViewPostRequest: Codable {
    let category: [String]
    
    init(category: [String]) {
        self.category = category
    }
}
