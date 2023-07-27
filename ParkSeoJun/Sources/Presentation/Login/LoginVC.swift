import UIKit
import Then
import SnapKit

final class LoginVC: BaseVC {
    
    private let loginLabel = TitleLabel().then{
        $0.text = "LOGIN"
    }
    
    private let idTextField = NormalTextField(placeholder: "이메일을 입력해주세요").then{
        $0.font = .boldSystemFont(ofSize: 14)
    }
    
    private let passwordTextField = SecureTextField(placeholder: "비밀번호를 입력해주세요").then{
        $0.font = .boldSystemFont(ofSize: 14)
    }
    
    private lazy var loginButton = NextStepButton().then{
        $0.setTitle("로그인", for: .normal)
        $0.isEnabled = false
    }
    
    private let firstTimeIdeaArchiveLabel = SmallTitleLabel().then{
        $0.text = "아직 회원이 아니신가요?"
        $0.textColor = UIColor(rgb: 0x767676)
    }
    
    private lazy var gotoSignupButton = AdditionalButton().then{
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x191919), for: .normal)
        $0.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0x000000)
        self.navigationController?.navigationBar.topItem?.title = ""
        
        idTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    override func addView() {
        view.addSubview(loginLabel)
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(firstTimeIdeaArchiveLabel)
        view.addSubview(gotoSignupButton)
    }
    
    override func setLayout(){
        self.loginLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(52)
            $0.centerX.equalTo(view.snp.centerX)
        }
        self.idTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(loginLabel.snp.bottom).offset(64)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        self.passwordTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(idTextField.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        self.loginButton.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(48)
            $0.leading.equalTo(self.view).offset(24)
            $0.centerX.equalTo(view.snp.centerX)
        }
        self.firstTimeIdeaArchiveLabel.snp.makeConstraints{
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
            $0.leading.equalTo(self.view).offset(84)
        }
        self.gotoSignupButton.snp.makeConstraints{
            $0.top.equalTo(loginButton.snp.bottom).offset(14)
            $0.leading.equalTo(firstTimeIdeaArchiveLabel.snp.trailing).offset(4)
        }

    }

    @objc func signupButtonTapped(_ sender: UIButton){
        let vc = SignupVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginVC {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if idTextField.text!.count > 0 && passwordTextField.text!.count > 0{
//            loginButton.backgroundColor = UIColor(rgb: 0x42CC89)
//            loginButton.isEnabled = true
        }
        else{
//            loginButton.backgroundColor = UIColor(rgb: 0x999999)
//            loginButton.isEnabled = false
        }
    }
}

