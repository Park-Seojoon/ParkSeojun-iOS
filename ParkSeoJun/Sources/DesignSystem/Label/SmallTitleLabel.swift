import UIKit

public final class SmallTitleLabel: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView(){
        textAlignment = .center
        font = .systemFont(ofSize: 14)
    }
}
