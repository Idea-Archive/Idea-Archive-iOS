import Foundation

struct ModifyCommentRequest: Codable {
    let Authorization: String
    let commentId: String
    let content: String
    
    init(Authorization: String, commentId: String, content: String) {
        self.Authorization = Authorization
        self.commentId = commentId
        self.content = content
    }
}
