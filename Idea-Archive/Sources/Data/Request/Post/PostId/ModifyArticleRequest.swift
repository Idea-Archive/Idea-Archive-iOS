import Foundation

struct ModifyArticleRequest: Codable {
    let Authorization: String
    let postId: String
    let title: String
    let content: String
    let category: [String]
    
    init(Authorization: String, postId: String, title: String, content: String, category: [String]) {
        self.Authorization = Authorization
        self.postId = postId
        self.title = title
        self.content = content
        self.category = category
    }
}
