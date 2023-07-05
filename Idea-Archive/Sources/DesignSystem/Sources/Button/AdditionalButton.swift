import UIKit

public final class AdditionalButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView(){
        backgroundColor = .white
        titleLabel?.font = .I_A(size: 13, family: .medium)
    }
}

