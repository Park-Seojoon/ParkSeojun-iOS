import UIKit

public final class TitleLabel: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView(){
        textColor = UIColor(rgb: 0x5074F3)
        textAlignment = .center
        font = .boldSystemFont(ofSize: 40)
    }
}

