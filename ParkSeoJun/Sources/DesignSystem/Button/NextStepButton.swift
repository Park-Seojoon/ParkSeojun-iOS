import UIKit

public final class NextStepButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView(){
        titleLabel?.font = .boldSystemFont(ofSize: 18)
        backgroundColor = UIColor(rgb: 0x5074F3)
        setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
