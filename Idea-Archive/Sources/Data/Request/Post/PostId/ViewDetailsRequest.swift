import Foundation

struct ViewDetailsRequest: Codable {
    let postId: String
    
    init(postId: String) {
        self.postId = postId
    }
}
