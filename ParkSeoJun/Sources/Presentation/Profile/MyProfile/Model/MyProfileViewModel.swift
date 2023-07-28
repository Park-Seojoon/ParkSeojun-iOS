import UIKit
import Moya

class MyProfileViewModel {
    let myProfileProvider = MoyaProvider<ProfileServices>()
    var myProfileData: MyProfileResponse!
}

extension MyProfileViewModel {
    
    func myProfile(accessToken: String, completion: @escaping (MyProfileResponse?) -> Void) {

        let param = MyProfileRequest.init(header: accessToken)
        
        myProfileProvider.request(.myProfile(param: param)){ response in
            switch response {
            case .success(let result):
                
                do {
                    self.myProfileData = try? result.map(MyProfileResponse.self)
                }catch(let err) {
                    print(String(describing: err))
                }
                
                let statusCode = result.statusCode
                
                switch statusCode {
                case 200..<300:
                    if let myProfileResponse = try? result.map(MyProfileResponse.self) {
                        completion(myProfileResponse)
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

