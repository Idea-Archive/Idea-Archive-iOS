import UIKit

public final class SelectedMajorButton: UIButton {
    public init(setTitle: String) {
        super.init(frame: .zero)
        
        setupButton()
        self.setTitle(setTitle, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
    
    func setupButton() {
        self.setTitleColor(.white, for: .normal)
        titleLabel?.font = .I_A(size: 12, family: .bold)
        layer.cornerRadius = 16
        layer.borderWidth = 1
        backgroundColor = UIColor(named: "PrimaryColor")
        
    }
}
