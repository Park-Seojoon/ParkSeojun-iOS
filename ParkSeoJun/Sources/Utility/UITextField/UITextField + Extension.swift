import UIKit

extension UITextField {
    
    func addUnderline(with color: UIColor, height: CGFloat) {
        let underline = CALayer()
        underline.backgroundColor = color.cgColor
        underline.frame = CGRect(x: 0, y: self.bounds.height - height, width: self.bounds.width, height: height)
        self.layer.addSublayer(underline)
    }

}
