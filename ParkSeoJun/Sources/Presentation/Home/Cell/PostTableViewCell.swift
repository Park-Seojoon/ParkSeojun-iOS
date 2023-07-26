import UIKit
import SnapKit
import Then

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addView()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let postImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 5
        $0.layer.masksToBounds = true
    }
    
    var titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 17)
    }
    
    var pointLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = UIColor.gray
    }
    
    private func addView() {
        [postImageView, titleLabel, pointLabel].forEach{
            contentView.addSubview($0)
            
        }
    }
    
    private func setLayout() {
        postImageView.snp.makeConstraints {
            $0.width.height.equalTo(110)
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(27)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalTo(postImageView.snp.trailing).offset(22)
        }
        pointLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(postImageView.snp.trailing).offset(22)
        }
    }
}
