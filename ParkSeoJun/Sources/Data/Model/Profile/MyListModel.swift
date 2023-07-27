import Foundation

struct MyListModel: Codable {
    let Authorization: String
}

struct MyListResponse: Codable {
    let boardList: [BoardList] 
}

struct BoardList: Codable {
    let id: CLong
    let title: String
    let point: Int
    let completed: Bool
    let url: String
}

