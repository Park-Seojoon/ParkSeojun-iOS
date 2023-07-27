import Foundation
import Moya

struct UserArticleRequest: Codable {
    let Authorization: String
    let title: String
    let content: String
    let files: String
    
    struct files: Codable {
        let filename: String
    }
    
    init(Authorization: String, title: String, content: String, files: String) {
        self.Authorization = Authorization
        self.title = title
        self.content = content
        self.files = files
    }
}
