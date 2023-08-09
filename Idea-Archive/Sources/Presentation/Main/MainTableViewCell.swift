import UIKit
import SnapKit
import Then

final class MainTableViewCell: UITableViewCell {
    
    static let cellId = "CellId"
    
    let postId = UILabel()
    let title = UILabel()
    let content = UITextView()
    let category = UILabel()
    let heartCount = UILabel()
    let commentCount = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
}
