import Foundation

struct LoginModel: Codable {
    let data: LoginResponse
}

struct LoginResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let accessExpiredAt: String
    let refreshExpiredAT: String
}
