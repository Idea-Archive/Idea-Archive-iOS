import UIKit

final class MainVC: BaseViewController {
    private let categoryStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private let entireCategoryButton = UIButton().then {
        $0.setTitle("전체", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    private let ideaCategoryButton = UIButton().then {
        $0.setTitle("아이디어", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    private let feedbackCategoryButton = UIButton().then {
        $0.setTitle("피드백", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    private let jobOpeningCategoryButton = UIButton().then {
        $0.setTitle("구인", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    private let settingStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 29
        $0.distribution = .equalSpacing
        $0.alignment = .fill
    }
    
    private let searchButton = UIButton().then {
        $0.setImage(systemName: "magnifyingglass")
        $0.tintColor = UIColor(rgb: 0x999999)
    }
    
    private let myPageButton = UIButton().then {
        $0.setImage(systemName: "line.3.horizontal")
        $0.tintColor = UIColor(rgb: 0x999999)
    }
    
    private let postListLabel = UILabel().then {
        $0.text = "게시글 목록"
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let newWritingButton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(named: "PrimaryColor")
        $0.layer.cornerRadius = 30
    }
    
    // MARK: - OverrideFunc
    override func setup() {
        self.view.backgroundColor = UIColor(rgb: 0xF2F2F2)
        
        let categoryLeftBarItem = UIBarButtonItem(customView: categoryStackView)
        self.navigationController?.navigationBar.topItem?.leftBarButtonItem = categoryLeftBarItem
        
        let settingRightBarItem = UIBarButtonItem(customView: settingStackView)
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = settingRightBarItem
    }
    
    // MARK: - UI
    override func addView() {
        view.addSubviews(categoryStackView, settingStackView,newWritingButton,postListLabel)
        
        [entireCategoryButton, ideaCategoryButton, feedbackCategoryButton, jobOpeningCategoryButton].forEach {
            categoryStackView.addArrangedSubview($0)
        }
        
        [searchButton, myPageButton].forEach{ settingStackView.addArrangedSubview($0)}
    }
    
    override func setLayout() {
        postListLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(68)
            $0.leading.equalToSuperview().inset(28)
        }
        
        newWritingButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(-15)
            $0.trailing.equalToSuperview().inset(28)
            $0.size.equalTo(60)
        }
    }
}
