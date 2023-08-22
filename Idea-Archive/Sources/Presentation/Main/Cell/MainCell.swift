import UIKit
import SnapKit
import Then

final class MainCell: UICollectionViewCell {
    static let id = "MainCell"
    
    let majorSelectButton = UIButton().then {
        $0.setTitleColor(UIColor(rgb: 0x000000), for: .normal)
        $0.layer.cornerRadius = 16
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(rgb: 0xE6E6E6).cgColor
        $0.titleLabel?.font = .I_A(size: 12, family: .medium)
        $0.backgroundColor = .white
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(self.majorSelectButton)
        
        majorSelectButton.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(contentView.safeAreaLayoutGuide)
            $0.height.equalTo(20)
        }
    }
}
