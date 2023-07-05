import UIKit

public final class NormalTextField: UITextField{
    
    init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        borderStyle = .roundedRect
        layer.cornerRadius = 10
        backgroundColor = UIColor(rgb: 0xF1F1F5)
        font = .I_A(size: 14, family: .regular)
        setPlaceholderColor(UIColor(rgb: 0x999999))
    }
    
}
