import UIKit

public final class SecureTextField: UITextField{
    
    var passwordEyeButton = UIButton(type: .custom)
    
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
        
        isSecureTextEntry = true
        setPasswordShownButtonImage()
    }
    
    func setPasswordShownButtonImage () {
        passwordEyeButton = UIButton.init (primaryAction: UIAction (handler: { [self]_ in
            isSecureTextEntry.toggle()
            self.passwordEyeButton.isSelected.toggle ()
        }))
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        
        passwordEyeButton.setImage (UIImage (systemName: "eye")?.withTintColor(UIColor(rgb: 0x999999), renderingMode: .alwaysOriginal), for: .normal)
        passwordEyeButton.setImage(UIImage(systemName: "eye.slash")?.withTintColor(UIColor(rgb: 0x999999), renderingMode: .alwaysOriginal), for: .selected)
        
        passwordEyeButton.configuration = buttonConfiguration
        passwordEyeButton.isSelected.toggle()
        
        rightView = passwordEyeButton
        rightViewMode = .always
    }
}

