import UIKit
import Then
import SnapKit

final class SignupVC: BaseVC {
    
    private let signupLabel = TitleLabel().then{
        $0.text = "SIGN UP"
    }
    
    private let nameTextField = NormalTextField(placeholder: "이름을 입력해주세요").then{
        $0.font = .boldSystemFont(ofSize: 14)
    }
    
    private let emailTextField = NormalTextField(placeholder: "이메일을 입력해주세요").then{
        $0.font = .boldSystemFont(ofSize: 14)
    }
    
    private let passwordTextField = SecureTextField(placeholder: "비밀번호를 입력해주세요").then{
        $0.font = .boldSystemFont(ofSize: 14)
    }
    
    private let passwordAgainTextField = SecureTextField(placeholder: "비밀번호를 한번 더 입력해주세요").then{
        $0.font = .boldSystemFont(ofSize: 14)
    }
    
    private lazy var confirmationButton = NextStepButton().then{
        $0.setTitle("확인", for: .normal)
        $0.addTarget(self, action: #selector(confirmationButtonTapped), for: .touchUpInside)
    }
    
    private let memberLabel = SmallTitleLabel().then{
        $0.text = "회원이신가요?"
        $0.textColor = UIColor(rgb: 0x767676)
    }
    
    private lazy var gotoLoginButton = AdditionalButton().then{
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x191919), for: .normal)
        $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    override func setup() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordAgainTextField.delegate = self
    }
    
    override func addView() {
        view.addSubview(signupLabel)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(passwordAgainTextField)
        view.addSubview(confirmationButton)
        view.addSubview(memberLabel)
        view.addSubview(gotoLoginButton)
    }
    
    override func setLayout(){
        self.signupLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(52)
            $0.centerX.equalTo(view.snp.centerX)
        }
        self.nameTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(signupLabel.snp.bottom).offset(64)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        self.emailTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(nameTextField.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        self.passwordTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(emailTextField.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        self.passwordAgainTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        self.confirmationButton.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(passwordAgainTextField.snp.bottom).offset(48)
            $0.leading.equalTo(self.view).offset(24)
            $0.centerX.equalTo(self.view.snp.centerX)
        }
        self.memberLabel.snp.makeConstraints{
            $0.top.equalTo(confirmationButton.snp.bottom).offset(12)
            $0.leading.equalTo(self.view).offset(126)
        }
        self.gotoLoginButton.snp.makeConstraints{
            $0.height.equalTo(20)
            $0.top.equalTo(confirmationButton.snp.bottom).offset(10)
            $0.leading.equalTo(memberLabel.snp.trailing).offset(4)
        }
    }
    
    @objc func confirmationButtonTapped(_ sender: UIButton){
        SignupViewModel().signupCompleted(
            email: emailTextField.text ?? "",
            name: nameTextField.text ?? "",
            password: passwordTextField.text ?? "",
            rePassword: passwordAgainTextField.text ?? "")
        
        SignupViewModel().onSignupSuccess = {
            print("성공했다 ㅎㅎ")
        }
        
        
    }
    
    @objc func loginButtonTapped(_ sender: UIButton){
        self.navigationController?.popToRootViewController(animated: true)
    }
}
