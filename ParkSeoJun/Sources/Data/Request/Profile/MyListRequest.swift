import Foundation

struct MyListRequest: Codable {
    let header: String
    
    init(header: String) {
        self.header = header
    }
}
