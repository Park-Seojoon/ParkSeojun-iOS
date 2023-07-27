import Foundation

struct SignupModel: Codable {
    let email: String
    let name: String
    let password: String
    let rePassword: String
}
