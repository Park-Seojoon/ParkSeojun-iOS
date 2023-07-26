import UIKit
import SnapKit
import Then
import IQKeyboardManagerSwift
import PhotosUI

class WriteVC: BaseVC {
    
    private let mainImageView = UIImageView().then{
        $0.tintColor = .gray
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 1
        $0.image = UIImage(systemName: "camera.fill")
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "제목"
        $0.font = UIFont.systemFont(ofSize: 17)
    }
    
    private let titleTextField = UITextField().then {
        $0.placeholder = "제목을 입력해주세요."
        $0.addUnderline(with: UIColor.black, height: 1.0)
    }
    
    private let titleTextfieldView = UIView().then{
        $0.backgroundColor = UIColor(rgb: 0xDDDDDD)
    }
    
    private let pointLabel = UILabel().then {
        $0.text = "포인트"
        $0.font = UIFont.systemFont(ofSize: 17)
    }
    
    private let pointTextField = UITextField().then {
        $0.placeholder = "포인트를 입력해주세요."
        $0.addUnderline(with: .black, height: 1.0)
        $0.keyboardType = .numberPad
    }
    
    private let pointTextfieldView = UIView().then{
        $0.backgroundColor = UIColor(rgb: 0xDDDDDD)
    }
    
    private let detailLabel = UILabel().then {
        $0.text = "내용"
        $0.font = UIFont.systemFont(ofSize: 17)
    }
    
    private let detailTextField = UITextView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderWidth = 0.8
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = UIColor(rgb: 0xBFBFBF).cgColor
    }
    
    private let enrollButton = UIButton().then {
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor(rgb: 0x5074F3)
        $0.setTitle("등록하기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.setTitleColor(.white, for: .normal)
    }
    
    override func addView() {
        [
            mainImageView,
            titleLabel,
            titleTextField,
            titleTextfieldView,
            pointLabel,
            pointTextField,
            pointTextfieldView,
            detailLabel,
            detailTextField,
            enrollButton
        ].forEach {
            view.addSubview($0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        setupData()
        //        setupButtonAction()
        setupTapGestures()
    }
    
    override func setLayout() {
        mainImageView.snp.makeConstraints {
            $0.width.height.equalTo(79)
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(35)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(35)
        }
        titleTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        titleTextfieldView .snp.makeConstraints{
            $0.height.equalTo(1)
            $0.top.equalTo(titleTextField.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        pointLabel.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(35)
        }
        pointTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.top.equalTo(pointLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        pointTextfieldView .snp.makeConstraints{
            $0.height.equalTo(1)
            $0.top.equalTo(pointTextField.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(pointTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(35)
        }
        detailTextField.snp.makeConstraints {
            $0.height.equalTo(200)
            $0.top.equalTo(detailLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        enrollButton.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.equalTo(detailTextField.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
    }
    
    func setupTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        self.mainImageView.addGestureRecognizer(tapGesture)
        self.mainImageView.isUserInteractionEnabled = true
    }
    
    @objc func selectImage() {
        setupImagePicker()
        
    }
    
    func setupImagePicker() {
        // 기본설정 셋팅
        var configuration = PHPickerConfiguration()
        configuration.filter = .any(of: [.images, .videos])
        
        // 기본설정을 가지고, 피커뷰컨트롤러 생성
        let picker = PHPickerViewController(configuration: configuration)
        // 피커뷰 컨트롤러의 대리자 설정
        picker.delegate = self
        // 피커뷰 띄우기
        self.present(picker, animated: true, completion: nil)
    }
    
}

extension WriteVC: PHPickerViewControllerDelegate {
    
    // 사진이 선택이 된 후에 호출되는 메서드
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // 피커뷰 dismiss
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    // 이미지뷰에 표시
                    self.mainImageView.image = image as? UIImage
                    
                }
            }
        } else {
            print("이미지 못 불러왔음!!!!")
        }
    }
}
