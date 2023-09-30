import Foundation

struct WriteArticleRequest: Codable {
    let Authorization: String
    let title: String
    let content: String
    let category: [String]
}
