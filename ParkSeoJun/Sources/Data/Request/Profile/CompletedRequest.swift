import Foundation

struct CompletedRequest: Codable {
    let id: Int
    let header: String
    
    init(id: Int,header: String) {
        self.id = id
        self.header = header
    }
}

