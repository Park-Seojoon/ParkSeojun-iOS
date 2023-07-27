import Foundation

struct UserArticleListRequest: Codable {
    let Authorization: String
    
    init(Authorization: String) {
        self.Authorization = Authorization
    }
    
    func toDictionary() -> [String: Any] {
            return ["Authorization": Authorization]
        }
}
