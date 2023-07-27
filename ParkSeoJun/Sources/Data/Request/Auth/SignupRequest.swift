import Foundation

struct SignupRequest: Codable {
    let email: String
    let name: String
    let password: String
    let rePassword: String
    
    init(email: String, name: String, password: String, rePassword: String) {
        self.email = email
        self.name = name
        self.password = password
        self.rePassword = rePassword
    }
}
