import Foundation

struct LoginModel: Codable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let accessToken: String
}
