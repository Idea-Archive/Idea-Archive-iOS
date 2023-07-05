import UIKit

public final class LargeTitleLabel: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView(){
        textAlignment = .left
        font = .I_A(size: 24, family: .semiBold)
    }
    
}

