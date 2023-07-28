import UIKit
import Moya

class AppliedListViewModel {
    let myAppliedListProfileProvider = MoyaProvider<ProfileServices>()
    
    var myAppliedListData: MyAppliedListResponse!
}

extension AppliedListViewModel {
    
    func getMyAppliedList(accessToken: String, completion: @escaping (MyAppliedListResponse?) -> Void) {
        
        let param = MyAppliedListRequest.init(header: accessToken)
        
        
        myAppliedListProfileProvider.request(.myAppliedList(param: param)) { response in
            switch response {
            case .success(let result):
                
                do {
                    self.myAppliedListData = try? result.map(MyAppliedListResponse.self)
                }catch(let err) {
                    print(String(describing: err))
                }
                
                let statusCode = result.statusCode
                
                switch statusCode {
                case 200..<300:
                    if let myAppliedListResponse = try? result.map(MyAppliedListResponse.self) {
                        completion(myAppliedListResponse)
                    } else {
                        print("Failed to parse MyAppliedListResponse")
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
