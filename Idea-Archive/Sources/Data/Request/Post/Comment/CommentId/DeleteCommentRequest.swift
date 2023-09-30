import Foundation

struct DeleteCommentRequest: Codable {
    let Authorization: String
    let commentId: String
    
    init(Authorization: String, commentId: String) {
        self.Authorization = Authorization
        self.commentId = commentId
    }
}
