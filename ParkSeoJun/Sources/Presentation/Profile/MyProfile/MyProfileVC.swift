import UIKit
import SnapKit
import Then

final class MyProfileVC: BaseVC {
    
    private let profileImage = UIImageView().then{
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 42.5
        $0.image = UIImage(named: "profileImage")
    }
    
    private let nicknameLabel = UILabel().then{
        $0.text = "신아인신아인신아인"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 16)
    }
    
    private lazy var editNicknameButton = AdditionalButton().then{
        $0.setTitle("닉네임 수정", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0xB8B8B8), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 12)
    }
    
    private let pointView = UIView().then{
        $0.layer.borderColor = UIColor(rgb: 0x898989).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.layer.masksToBounds = false
        $0.backgroundColor = .white
    }
    
    private let pointLabel = UILabel().then{
        $0.text = "Point"
        $0.textColor = UIColor(rgb: 0x5074F3)
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 22)
    }
    
    private let myPointLabel = UILabel().then{
        $0.text = "10,000"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private lazy var chargeButton = NextStepButton().then{
        $0.setTitle("충전하기", for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 11)
    }
    
    private lazy var withdrawlButton = NextStepButton().then{
        $0.setTitle("인출하기", for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 11)
    }
    
    private let middleView = UIView().then{
        $0.layer.masksToBounds = false
        $0.backgroundColor = UIColor(rgb: 0xDDDDDD)
    }
    
    private let writeHistoryButton = UIButton().then{
        $0.setTitle("   글 작성내역", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x000000), for: .normal)
        $0.setImage(UIImage(systemName: "pencil"), for: .normal)
        $0.tintColor = .black
        $0.titleLabel?.font = .boldSystemFont(ofSize: 11)
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(writeHistoryButtonTapped), for: .touchUpInside)
    }
    
    private let appliedStatusButton = UIButton().then{
        $0.setTitle("  신청현황", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x000000), for: .normal)
        $0.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        $0.tintColor = .black
        $0.titleLabel?.font = .boldSystemFont(ofSize: 11)
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(appliedStatusButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            if let (userId, token) = try KeychainManager.get() {
                print("User ID: \(userId)")
                print("Token: \(token)")
            } else {
                print("No data found in Keychain.")
            }
        } catch let error {
            print("Error while retrieving data from Keychain: \(error)")
        }
        


        
    }
    
    override func addView() {
        view.addSubview(profileImage)
        view.addSubview(nicknameLabel)
        view.addSubview(editNicknameButton)
        view.addSubview(pointView)
        view.addSubview(pointLabel)
        view.addSubview(myPointLabel)
        view.addSubview(chargeButton)
        view.addSubview(withdrawlButton)
        view.addSubview(middleView)
        view.addSubview(writeHistoryButton)
        view.addSubview(appliedStatusButton)
    }
    
    override func setLayout(){
        self.profileImage.snp.makeConstraints{
            $0.height.width.equalTo(85)
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(22)
            $0.leading.equalTo(self.view).offset(28)
        }
        self.nicknameLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(42)
            $0.leading.equalTo(self.view).offset(128)
        }
        self.editNicknameButton.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(69)
            $0.leading.equalTo(self.view).offset(128)
        }
        self.pointView.snp.makeConstraints{
            $0.height.equalTo(100)
            $0.top.equalTo(profileImage.snp.bottom).offset(28)
            $0.leading.trailing.equalTo(self.view).inset(30)
        }
        self.pointLabel.snp.makeConstraints{
            $0.top.equalTo(pointView.snp.top).offset(15)
            $0.leading.equalTo(pointView.snp.leading).offset(20)
        }
        self.myPointLabel.snp.makeConstraints {
            $0.top.equalTo(pointView.snp.top).offset(14)
            $0.trailing.equalTo(pointView.snp.trailing).inset(20)
        }
        self.chargeButton.snp.makeConstraints {
            $0.height.equalTo(28)
            $0.width.equalTo(128)
            $0.top.equalTo(pointLabel.snp.bottom).offset(22)
            $0.leading.equalTo(pointView.snp.leading).offset(28)
        }
        self.withdrawlButton.snp.makeConstraints{
            $0.height.equalTo(28)
            $0.width.equalTo(128)
            $0.top.equalTo(pointLabel.snp.bottom).offset(22)
            $0.trailing.equalTo(pointView.snp.trailing).inset(28)
        }
        self.middleView.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.top.equalTo(pointView.snp.bottom).offset(46)
            $0.leading.trailing.equalToSuperview()
        }
        self.writeHistoryButton.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.width.equalTo(115)
            $0.top.equalTo(middleView.snp.bottom).offset(24)
            $0.leading.equalTo(self.view).offset(28)
        }
        self.appliedStatusButton.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.width.equalTo(115)
            $0.top.equalTo(writeHistoryButton.snp.bottom).offset(16)
            $0.leading.equalTo(self.view).offset(28)
        }
    }
    
    @objc func writeHistoryButtonTapped(_ sender: UIButton){
        let vc = HistoryVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func appliedStatusButtonTapped(_ sender: UIButton){
        let vc = AppliedStatusVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


