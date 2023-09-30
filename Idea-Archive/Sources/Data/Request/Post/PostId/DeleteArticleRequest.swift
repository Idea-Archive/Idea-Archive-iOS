import Foundation

struct DeleteArticleRequest: Codable {
    let Authorization: String
    let postId: String
    
    init(Authorization: String, postId: String) {
        self.Authorization = Authorization
        self.postId = postId
    }
}
