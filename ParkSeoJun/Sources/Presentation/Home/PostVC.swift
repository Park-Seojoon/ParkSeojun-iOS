//
//  PostVC.swift
//  ParkSeoJun
//
//  Created by 신아인 on 2023/07/27.
//

import UIKit
import SnapKit
import Then

class PostVC: BaseVC {
    
    private let scrollView = UIScrollView()
    
    let contentView = UIView()
    
    private let postImageView = UIImageView().then {
        $0.image = UIImage(systemName: "house")
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "우앙아아아아아아아앙"
    }
    
    private let pointLabel = UILabel().then {
        $0.text = "1000 point"
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = UIColor.gray
    }
    
    private let lineView = UIView().then{
        $0.backgroundColor = UIColor(rgb: 0xDDDDDD)
    }
    
    private let detailLabel = UILabel().then {
        $0.text = """
                  하이하이
                  하이
                  하 - 이
                  
                  하이요 ~~
                  
                  
                  
                  커아ㅣㄴ머ㅐㅑㅇㅈ머ㅐㅇㅁㄹㅇ
                  ㅁㅈㄹㄷㅈㅁㄹㄷㄱㅁ
                  fdsfdsf
                  fdsfdsfsdfdsfdf
                  fdsfdsfdsssssssss
                  sss
                  ss
                  ssssss
                  fffffffffffff
                  fffffffff
                  """
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 14)
    }
    
    private let applyButton = UIButton().then {
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor(rgb: 0x5074F3)
        $0.setTitle("신청하기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.setTitleColor(.white, for: .normal)
    }
    
    override func addView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [postImageView, titleLabel, pointLabel, lineView, detailLabel].forEach {
            contentView.addSubview($0)
            view.addSubview(applyButton)
        }
    }
    
    override func setLayout() {
        scrollView.contentSize = contentView.bounds.size
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.bottom.equalTo(applyButton.snp.bottom).offset(100)
        }
        postImageView.snp.makeConstraints {
            $0.height.equalTo(260)
            $0.width.equalToSuperview()
            $0.top.equalTo(scrollView.snp.top)
            $0.leading.trailing.equalTo(scrollView)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(postImageView.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(30)
        }
        pointLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(scrollView).offset(30)
        }
        lineView .snp.makeConstraints{
            $0.height.equalTo(1)
            $0.top.equalTo(pointLabel.snp.bottom).offset(25)
            $0.leading.trailing.equalTo(scrollView)
        }
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(30)
        }
        applyButton.snp.makeConstraints {
            $0.width.equalTo(120)
            $0.height.equalTo(40)
            $0.top.equalTo(detailLabel.snp.bottom).offset(40)
            $0.trailing.equalTo(contentView).inset(30)
        }
    }
}

