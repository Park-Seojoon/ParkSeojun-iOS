import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    static let identifier = "HistoryTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addView()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let userProfile = UIImageView().then {
        $0.layer.cornerRadius = 5
        $0.image = UIImage(named: "profileImage")
        $0.layer.cornerRadius = 5
        $0.layer.masksToBounds = true
    }
    
    var titleLabel = UILabel().then {
        $0.text = "TitleTitleTitle"
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    var pointLabel = UILabel().then {
        $0.text = "1,000 point"
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = UIColor(rgb: 0xC0BCBC)
    }
    
    private lazy var acceptButton = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.setTitle("수락", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 13)
        $0.backgroundColor = UIColor(rgb: 0x5074F3)
        
    }
    
    private func addView() {
        [userProfile, titleLabel, pointLabel, acceptButton].forEach{
            contentView.addSubview($0)
        
        }
    }
    
    private func setLayout() {
        userProfile.snp.makeConstraints {
            $0.width.height.equalTo(76)
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(27)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalTo(userProfile.snp.trailing).offset(22)
        }
        pointLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(userProfile.snp.trailing).offset(22)
        }
        acceptButton.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(60)
            $0.top.equalToSuperview().offset(28)
            $0.trailing.equalToSuperview().inset(28)
            
        }
    }
}
