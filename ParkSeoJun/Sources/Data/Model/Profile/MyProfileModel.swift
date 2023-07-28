import Foundation

struct MyProfileModel: Codable {
    let Authorization: String
}

struct MyProfileResponse: Codable {
    let name: String
    let point: Int
}

