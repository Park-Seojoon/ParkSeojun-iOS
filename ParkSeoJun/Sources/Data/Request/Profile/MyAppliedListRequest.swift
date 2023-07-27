import Foundation

struct MyAppliedListRequest: Codable {
    let header: String
    
    init(header: String) {
        self.header = header
    }
}
