import Foundation

struct MyAppliedListModel: Codable {
    let Authorization: String
}

struct MyAppliedListResponse: Codable {
    let boardList: [BoardList2]
}

struct BoardList2: Codable {
    let id: CLong
    let title: String
    let point: Int
    let completed: Bool
    let url: String
}
