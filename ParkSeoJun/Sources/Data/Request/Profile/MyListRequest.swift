import Foundation

struct MyListRequest: Codable {
    let header: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
