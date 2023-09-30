import Foundation

struct WriteArticleRequest: Codable {
    let Authorization: String
    let title: String
    let content: String
    let category: [String]
    
    init(Authorization: String, title: String, content: String, category: [String]) {
        self.Authorization = Authorization
        self.title = title
        self.content = content
        self.category = category
    }
}
