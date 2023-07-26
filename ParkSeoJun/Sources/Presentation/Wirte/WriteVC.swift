//
//  WriteVC.swift
//  ParkSeoJun
//
//  Created by 신아인 on 2023/07/26.
//

import UIKit
import SnapKit
import Then

class WriteVC: BaseVC {
    
    private let imageButton = UIButton().then {
        $0.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        $0.tintColor = UIColor(rgb: 0xBFBFBF)
        $0.layer.borderWidth = 0.8
        $0.layer.borderColor = UIColor(rgb: 0xBFBFBF).cgColor
        $0.layer.cornerRadius = 8
        
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "제목"
        $0.font = UIFont.systemFont(ofSize: 17)
    }
    
    private let titleTextField = UITextField().then {
        $0.placeholder = "제목을 입력해주세요."
        $0.addUnderline(with: .black, height: 1.0)
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
        [imageButton, titleLabel, titleTextField, pointLabel, pointTextField, detailLabel, detailTextField, enrollButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        imageButton.snp.makeConstraints {
            $0.width.height.equalTo(70)
            $0.top.equalToSuperview().offset(90)
            $0.leading.equalToSuperview().offset(35)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageButton.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(35)
        }
        titleTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        pointLabel.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(35)
        }
        pointTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.top.equalTo(pointLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(pointTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(35)
        }
        detailTextField.snp.makeConstraints {
            $0.height.equalTo(270)
            $0.top.equalTo(detailLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        enrollButton.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.equalTo(detailTextField.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
    }
    
    @objc func selectImage() {
        
    }
}
