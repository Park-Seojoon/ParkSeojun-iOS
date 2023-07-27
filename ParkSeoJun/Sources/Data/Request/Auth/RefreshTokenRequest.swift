import Foundation

struct RefreshTokenRequest: Codable {
    let RefreshToken: String
    
    init(RefreshToken: String) {
        self.RefreshToken = RefreshToken
    }
}
