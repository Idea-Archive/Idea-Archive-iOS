import UIKit

public final class MajorSelectButton: UIButton {
    
    public init(setTitle: String) {
        super.init(frame: .zero)
        setupView()
        
        self.setTitle(setTitle, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        setTitleColor(UIColor(rgb: 0x000000), for: .normal)
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = UIColor(rgb: 0xE6E6E6).cgColor
        titleLabel?.font = .I_A(size: 12, family: .medium)
    }
}
