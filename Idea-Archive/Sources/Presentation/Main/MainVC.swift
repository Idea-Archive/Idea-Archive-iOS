import UIKit

final class MainVC: BaseViewController {
    private let mainTableView = UITableView().then {
        $0.backgroundColor = .clear
    }
    
    private let categoryStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private let entireCategoryButton = UIButton().then {
        $0.setTitle("전체", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.titleLabel?.font = .I_A(size: 19, family: .semiBold)
    }
    
    private let ideaCategoryButton = UIButton().then {
        $0.setTitle("아이디어", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.titleLabel?.font = .I_A(size: 19, family: .semiBold)
    }
    
    private let feedbackCategoryButton = UIButton().then {
        $0.setTitle("피드백", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.titleLabel?.font = .I_A(size: 19, family: .semiBold)
    }
    
    private let jobOpeningCategoryButton = UIButton().then {
        $0.setTitle("구인", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.titleLabel?.font = .I_A(size: 19, family: .semiBold)
    }
    
    private let settingStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 24
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
    
    private let mainHeaderView = UIView()
    
    private let selectMajorStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 4
        $0.distribution = .equalSpacing
        $0.alignment = .fill
    }
    
    private let frontButton = MajorSelectButton(setTitle: "FrontEnd")
    private let backendButton = MajorSelectButton(setTitle: "BackEnd")
    private let aosButton = MajorSelectButton(setTitle: "Android")
    private let iosButton = MajorSelectButton(setTitle: "iOS")
    private let designButton = MajorSelectButton(setTitle: "Design")
    private let devButton = MajorSelectButton(setTitle: "DevOps")
    
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
        view.addSubviews(categoryStackView, settingStackView,newWritingButton,postListLabel, mainTableView)
        
        mainTableView.addSubviews(mainHeaderView, newWritingButton)
        
        mainHeaderView.addSubviews(selectMajorStackView, postListLabel)
        
        [entireCategoryButton, ideaCategoryButton, feedbackCategoryButton, jobOpeningCategoryButton].forEach {
            categoryStackView.addArrangedSubview($0)
        }
        
        [searchButton, myPageButton].forEach{ settingStackView.addArrangedSubview($0)
        }
    
        [frontButton, backendButton, aosButton, iosButton, designButton, devButton].forEach {
            selectMajorStackView.addArrangedSubview($0)
        }
    }
    
    override func setLayout() {
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(16)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        
        mainHeaderView.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(mainTableView.safeAreaLayoutGuide)
            $0.height.equalTo(56)
        }
        
        selectMajorStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(mainHeaderView)
            $0.height.equalTo(32)
        }
        
        postListLabel.snp.makeConstraints {
            $0.top.equalTo(selectMajorStackView.snp.bottom).inset(-16)
            $0.leading.equalTo(mainHeaderView).inset(28)
        }
        
        newWritingButton.snp.makeConstraints {
            $0.bottom.equalTo(mainTableView.frameLayoutGuide).inset(15)
            $0.trailing.equalTo(mainTableView.frameLayoutGuide).inset(28)
            $0.size.equalTo(60)
        }
    }
}
