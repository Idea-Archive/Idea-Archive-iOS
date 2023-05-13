import UIKit

public final class NormalTextField: UITextField{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView(){
        borderStyle = .roundedRect
        layer.cornerRadius = 10
        backgroundColor = UIColor(rgb: 0xF1F1F5)
    }
    
}

public extension UITextField {
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: UIColor(rgb: 0x999999),
                .font: font
            ].compactMapValues { $0 }
        )
    }
}
