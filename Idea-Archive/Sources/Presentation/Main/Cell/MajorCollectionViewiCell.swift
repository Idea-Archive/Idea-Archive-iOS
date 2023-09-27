import UIKit
import SnapKit
import Then

final class MajorCollectionViewCell: UICollectionViewCell {
    static let id = "MainCell"
    
    let majorSelectLabel = MajorsLabel().then {
        $0.textColor = UIColor.black
        $0.layer.cornerRadius = 16
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(rgb: 0xE6E6E6).cgColor
        $0.font = .I_A(size: 12, family: .medium)
        $0.numberOfLines = 0
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(self.majorSelectLabel)
        
        majorSelectLabel.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.leading.equalToSuperview().inset(20)
        }
    }
}
