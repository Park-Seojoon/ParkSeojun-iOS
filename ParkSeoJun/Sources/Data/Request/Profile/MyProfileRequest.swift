import Foundation

struct MyProfileRequest: Codable {
    let header: String
    
    init(header: String) {
        self.header = header
    }
}

