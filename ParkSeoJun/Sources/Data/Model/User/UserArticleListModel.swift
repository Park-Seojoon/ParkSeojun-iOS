import Foundation

struct UserArticleListModel: Codable {
    let boardList: [UserArticleListResponse]
}

struct UserArticleListResponse: Codable {
    let id: Int
    let title: String
    let point: Int
    let url: String
}
