import UIKit

final class MainVC: BaseVC {
    let majors = ["FrontEnd", "BackEnd", "Android", "iOS", "Design", "DevOps"]
    
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 8.0
    }
    
    private lazy var majorcollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout).then {
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        $0.contentInset = .zero
        $0.clipsToBounds = true
        $0.register(MajorCollectionViewCell.self, forCellWithReuseIdentifier: MajorCollectionViewCell.id)
        $0.backgroundColor = .clear
    }
    
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
    
    private let postListLabel = UILabel().then {
        $0.text = "게시글 목록"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = .I_A(size: 15, family: .medium)
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
        
        self.majorcollectionView.dataSource = self
    }
    
    // MARK: - UI
    override func addView() {
        view.addSubviews(categoryStackView,
                         settingStackView,
                         newWritingButton,
                         postListLabel,
                         mainTableView
        )
        
        mainTableView.addSubviews(mainHeaderView, newWritingButton)

        mainHeaderView.addSubviews(postListLabel, majorcollectionView)
        
        [entireCategoryButton,
         ideaCategoryButton,
         feedbackCategoryButton,
         jobOpeningCategoryButton].forEach {
            categoryStackView.addArrangedSubview($0)
        }
        
        [searchButton,
         myPageButton].forEach{
            settingStackView.addArrangedSubview($0)
        }
    }
    
    override func setLayout() {
        mainTableView.snp.makeConstraints {
            $0.leading.trailing.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        
        mainHeaderView.snp.makeConstraints{
            $0.top.equalTo(mainTableView.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(mainTableView.safeAreaLayoutGuide)
            $0.height.equalTo(84)
        }
        
        majorcollectionView.snp.makeConstraints {
            $0.top.trailing.leading.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        postListLabel.snp.makeConstraints {
            $0.bottom.equalTo(mainHeaderView.snp.bottom)
            $0.leading.equalTo(mainHeaderView).inset(24)
        }
        
        newWritingButton.snp.makeConstraints {
            $0.bottom.equalTo(mainTableView.frameLayoutGuide).inset(15)
            $0.trailing.equalTo(mainTableView.frameLayoutGuide).inset(28)
            $0.size.equalTo(60)
        }
    }
}

extension MainVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return majors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! MajorCollectionViewCell
        
        cell.majorSelectLabel.text = majors[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        
        return CGSize(width: width, height: 32)
    }
}
