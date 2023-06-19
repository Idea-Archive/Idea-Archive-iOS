import UIKit

final class MainVC: BaseViewController {
    // MARK: - Properties
    
    private let filterStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 8
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private let entireFilterButton = UIButton().then {
        $0.setTitle("전체", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    private let ideaFilterButton = UIButton().then {
        $0.setTitle("아이디어", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    private let feedbackFilterButton = UIButton().then {
        $0.setTitle("피드백", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    private let jobOpeningFilterButton = UIButton().then {
        $0.setTitle("구인", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
    }

    private let settingStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
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
        $0.translatesAutoresizingMaskIntoConstraints = false
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
    }
    
    // MARK: - UI
    override func addView() {
        view.addSubViews(filterStackView, settingStackView,newWritingButton,postListLabel)
        
        filterStackView.addArrangedSubview(entireFilterButton)
        filterStackView.addArrangedSubview(ideaFilterButton)
        filterStackView.addArrangedSubview(feedbackFilterButton)
        filterStackView.addArrangedSubview(jobOpeningFilterButton)
        
        settingStackView.addArrangedSubview(searchButton)
        settingStackView.addArrangedSubview(myPageButton)
    }
    
    override func setLayout() {
        filterStackView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(16)
            $0.leading.equalToSuperview().inset(20)
        }
        
        settingStackView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        postListLabel.snp.makeConstraints {
            $0.top.equalTo(filterStackView.snp.bottom).inset(-68)
            $0.leading.equalToSuperview().inset(28)
        }
        
        newWritingButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(-15)
            $0.trailing.equalToSuperview().inset(28)
            $0.size.equalTo(60)
        }
    }
}
