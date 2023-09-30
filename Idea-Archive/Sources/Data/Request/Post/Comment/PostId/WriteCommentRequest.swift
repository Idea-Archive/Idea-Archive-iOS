import Foundation

struct WriteCommentRequest: Codable {
    let Authorization: String
    let postId : String
    let content: String
    
    init(Authorization: String, postId: String, content: String) {
        self.Authorization = Authorization
        self.postId = postId
        self.content = content
    }
}
