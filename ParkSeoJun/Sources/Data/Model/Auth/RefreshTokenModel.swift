import Foundation

struct RefreshTokenModel: Codable {
    let data: RefreshTokenResponse
}

struct RefreshTokenResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let accessExpiredAt: String
    let refreshExpiredAT: String
}
