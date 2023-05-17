import UIKit

public final class SecureTextField: UITextField {
    
    var passwordToggleButton = UIButton(type: .custom)
    
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
        setPlaceholderColor(UIColor(rgb: 0x99999))
        
        isSecureTextEntry = true
        setPasswordToggleButtonImage()
    }
    
    func setPasswordToggleButtonImage() {
        passwordToggleButton = UIButton.init (primaryAction: UIAction (handler: { [self]_ in
            isSecureTextEntry.toggle()
            self.passwordToggleButton.isSelected.toggle ()
        }))
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        
        passwordToggleButton.setImage (UIImage (systemName: "eye")?.withTintColor(UIColor(rgb: 0x999999), renderingMode: .alwaysOriginal), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.slash")?.withTintColor(UIColor(rgb: 0x999999), renderingMode: .alwaysOriginal), for: .selected)
        
        passwordToggleButton.configuration = buttonConfiguration
        passwordToggleButton.isSelected.toggle()
        
        rightView = passwordToggleButton
        rightViewMode = .always
    }
}

