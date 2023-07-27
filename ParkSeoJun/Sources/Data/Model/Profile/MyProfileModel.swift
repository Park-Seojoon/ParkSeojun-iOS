import Foundation

struct MyProfileModel: Codable {
    let Authorization: String
}

struct MyProfileResponse: Codable {
    let boardList: [MyProfile]
}

struct MyProfile: Codable {
    let name: String
    let point: Int
}


