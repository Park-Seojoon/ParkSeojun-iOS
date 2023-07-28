import UIKit
import Moya

class MyListViewModel {
    let myListProfileProvider = MoyaProvider<ProfileServices>()
    var myListData: MyListResponse!
}

extension MyListViewModel {
    
    func getMyList(accessToken: String, completion: @escaping (MyListResponse?) -> Void) {
        
        let param = MyListRequest.init(header: accessToken)
        
        myListProfileProvider.request(.myList(param: param)) { response in
            switch response {
            case .success(let result):
                
                do {
                    self.myListData = try? result.map(MyListResponse.self)
                }catch(let err) {
                    print(String(describing: err))
                }
                
                let statusCode = result.statusCode
                
                switch statusCode {
                case 200..<300:
                    if let myListResponse = try? result.map(MyListResponse.self) {
                        print(myListResponse)
                        completion(myListResponse)
                    } else {
                        print("Failed to parse MyListResponse")
                        completion(nil)
                    }
                case 400:
                    print("Signup failed with status code: \(statusCode)")
                default:
                    print(statusCode)
                }
            case .failure(let err):
                print(String(describing: err))
            }
        }
    }
}
