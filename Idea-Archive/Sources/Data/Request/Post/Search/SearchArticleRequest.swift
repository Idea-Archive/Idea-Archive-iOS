import Foundation

struct SearchArticleRequest: Codable {
    let keyword: String
    let category: [String]
    
    init(keyword: String, category: [String]) {
        self.keyword = keyword
        self.category = category
    }
}
